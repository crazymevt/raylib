;;;; library.lisp — finding libraylib, building the shim, loading both

(in-package #:raylib)

(defun default-library-directories ()
  "RAYLIB_LISP_LIBRARY_PATH's directories, then the usual places for the platform."
  (append
   (let ((env (uiop:getenv "RAYLIB_LISP_LIBRARY_PATH")))
     (when (and env (plusp (length env)))
       (mapcar #'uiop:ensure-directory-pathname
               (uiop:split-string env :separator (string (uiop:inter-directory-separator))))))
   #+darwin '(#p"/opt/homebrew/lib/" #p"/usr/local/lib/" #p"/opt/local/lib/")
   #+linux '(#p"/usr/local/lib/" #p"/usr/lib/" #p"/usr/lib64/"
             #p"/usr/lib/x86_64-linux-gnu/" #p"/usr/lib/aarch64-linux-gnu/")
   #+windows '()))

(defvar *library-directories* (default-library-directories)
  "Directories searched for libraylib, in order. Initialized from
RAYLIB_LISP_LIBRARY_PATH and the usual places for the platform.")

(defparameter *library-names*
  #+darwin '("libraylib.600.dylib" "libraylib.dylib")
  #+linux '("libraylib.so.600" "libraylib.so")
  #+windows '("raylib.dll" "libraylib.dll")
  "File names tried in each directory. Versioned names come first: the bindings
are generated for raylib 6.0, and other versions differ in their structs.")

(defvar *library-path* nil
  "The libraylib file loaded, once loaded.")

(defun find-raylib ()
  (or (loop for dir in *library-directories*
            thereis (loop for name in *library-names*
                          thereis (probe-file (merge-pathnames name dir))))
      (error "Can't find raylib 6.0. Looked for ~{~a~^, ~} in:~%~{  ~a~%~}~
              Install it (macOS: brew install raylib), or set RAYLIB_LISP_LIBRARY_PATH ~
              to the directory containing it."
             *library-names* *library-directories*)))

;;; The shim: C wrappers for the functions that pass structs by value,
;;; compiled on first load into build/ and rebuilt when shim.c changes.

(defun shim-source ()
  (asdf:system-relative-pathname "raylib" "src/generated/shim.c"))

(defun shim-library ()
  (asdf:system-relative-pathname
   "raylib" (format nil "build/libraylib-shim.~a" #+darwin "dylib" #+windows "dll" #-(or darwin windows) "so")))

(defun include-directory (library)
  "The directory holding raylib.h: RAYLIB_INCLUDE_DIR, or include/ beside LIBRARY's lib/."
  (let ((env (uiop:getenv "RAYLIB_INCLUDE_DIR")))
    (or (and env (plusp (length env)) (uiop:ensure-directory-pathname env))
        (let ((dir (merge-pathnames "../include/" (uiop:pathname-directory-pathname library))))
          (and (probe-file (merge-pathnames "raylib.h" dir)) (truename dir)))
        (error "Can't find raylib.h next to ~a. Set RAYLIB_INCLUDE_DIR to its directory." library))))

(defun build-shim (library)
  "Compile shim.c into the shim library unless it is up to date. Its raylib
symbols resolve against the libraylib already loaded, so there is only one."
  (let ((out (shim-library))
        (src (shim-source)))
    (unless (and (probe-file out) (>= (file-write-date out) (file-write-date src)))
      (ensure-directories-exist out)
      (let ((command (append
                      (list (or (uiop:getenv "CC") "cc") "-O2" "-shared" "-fPIC"
                            "-o" (uiop:native-namestring out) (uiop:native-namestring src)
                            "-I" (uiop:native-namestring (include-directory library)))
                      #+darwin '("-undefined" "dynamic_lookup")
                      #+windows (list "-L" (uiop:native-namestring (uiop:pathname-directory-pathname library))
                                      "-lraylib"))))
        (multiple-value-bind (output errors status)
            (uiop:run-program command :output :string :error-output :string :ignore-error-status t)
          (declare (ignore output))
          (unless (zerop status)
            (error "Couldn't compile the raylib shim. It needs a C compiler ~
                    (macOS: xcode-select --install).~%Command: ~{~a~^ ~}~%~a"
                   command errors)))))
    out))

(defun load-libraries ()
  "Load libraylib and the shim, building the shim first if needed. Runs when
the system loads; call it again in a saved image before using raylib."
  (let ((library (find-raylib)))
    (cffi:load-foreign-library library)
    (setf *library-path* library)
    (cffi:load-foreign-library (build-shim library))
    library))

(load-libraries)
