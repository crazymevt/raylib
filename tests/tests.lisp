;;;; tests.lisp — (asdf:test-system :raylib)
;;;;
;;;; Everything but WINDOW runs without opening a window. WINDOW opens one for
;;;; a moment, on the main thread.

(defpackage #:raylib-tests
  (:use #:cl #:parachute))

(in-package #:raylib-tests)

(define-test raylib-tests)

;;; The generator

(define-test naming
  :parent raylib-tests
  (is string= "draw-texture-v" (raylib.generator:lisp-name "DrawTextureV"))
  (is string= "vector2-add" (raylib.generator:lisp-name "Vector2Add"))
  (is string= "begin-mode-2d" (raylib.generator:lisp-name "BeginMode2D"))
  (is string= "get-fps" (raylib.generator:lisp-name "GetFPS"))
  (is string= "n-patch-info" (raylib.generator:lisp-name "NPatchInfo"))
  (is string= "offset-x" (raylib.generator:lisp-name "offsetX"))
  (is string= "load-utf8" (raylib.generator:lisp-name "LoadUTF8")))

(define-test generated-files-current
  :parent raylib-tests
  :description "The committed bindings are what the generator writes now."
  (let ((dir (merge-pathnames (format nil "raylib-gen-~36r/" (random (expt 36 8) (make-random-state t)))
                              (uiop:temporary-directory))))
    (unwind-protect
         (progn
           (let ((*standard-output* (make-broadcast-stream)))
             (raylib.generator:generate :output-directory dir))
           (dolist (file '("raylib.lisp" "shim.c"))
             (is string=
                 (uiop:read-file-string (asdf:system-relative-pathname "raylib" (format nil "src/generated/~a" file)))
                 (uiop:read-file-string (merge-pathnames file dir))
                 "~a is out of date: run (raylib.generator:generate)" file)))
      (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore))))

;;; Values passed to and from C

(define-test structs
  :parent raylib-tests
  (is equalp (rl:rect 5 5 5 5) (rl:get-collision-rec (rl:rect 0 0 10 10) (rl:rect 5 5 10 10)))
  (is equalp (rl:rect 5 5 5 5) (rl:get-collision-rec '(0 0 10 10) #(5 5 10 10)) "from sequences")
  (true (rl:check-collision-recs (rl:rect 0 0 10 10) (rl:rect 5 5 10 10)))
  (false (rl:check-collision-recs (rl:rect 0 0 10 10) (rl:rect 50 5 10 10)))
  (is equalp (rl:vec2 5 10) (rl:get-spline-point-linear (rl:vec2 0 0) (rl:vec2 10 20) 1/2) "ratio as float")
  (is equalp (rl:make-camera-2d) (rl:make-camera-2d :zoom 1.0) "camera zoom defaults to 1"))

(define-test colors
  :parent raylib-tests
  (is equalp (rl:color 230 41 55) (rl:color :red))
  (is equalp (rl:color :red) (rl:color-alpha :red 1.0) "keyword argument")
  (is equalp (rl:color 255 0 0 127) (rl:fade #xFF000080 0.5) "integer argument")
  (is equalp (rl:color 255 0 0) (rl:get-color #xFF0000FF))
  (is = #xFF0000FF (ldb (byte 32 0) (rl:color-to-int '(255 0 0))) "three numbers mean opaque")
  (fail (rl:color-to-int :not-a-color)))

(define-test enums
  :parent raylib-tests
  (is = 32 (rl:enum-value 'rl:keyboard-key :space))
  (is = 32 (rl:enum-value 'rl:keyboard-key 32))
  (is eq :space (rl:enum-keyword 'rl:keyboard-key 32))
  (is = (logior 4 64) (rl:enum-value 'rl:config-flags '(:window-resizable :vsync-hint)))
  (true (member :left (rl:enum-keywords 'rl:mouse-button)))
  (fail (rl:enum-value 'rl:keyboard-key :no-such-key)))

(define-test strings
  :parent raylib-tests
  (is string= "HELLO" (rl:text-to-upper "hello"))
  (is = 4 (rl:text-length "four"))
  (true (rl:file-exists (asdf:system-relative-pathname "raylib" "raylib.asd")) "pathname argument")
  (false (rl:file-exists "no/such/file")))

(define-test arrays-and-in-place-updates
  :parent raylib-tests
  (true (rl:check-collision-point-poly '(5 5) '((0 0) (10 0) (10 10) (0 10)) 4))
  (false (rl:check-collision-point-poly '(15 5) (vector (rl:vec2 0 0) (rl:vec2 10 0) (rl:vec2 10 10)) 3))
  (let ((image (rl:gen-image-color 64 32 :blue)))
    (unwind-protect
         (progn
           (rl:image-crop image (rl:rect 0 0 16 8))
           (is = 16 (rl:image-width image) "image-crop updated the Lisp image")
           (is = 8 (rl:image-height image))
           (is equalp (rl:color :blue) (rl:get-image-color image 1 1)))
      (rl:unload-image image)))
  (let ((point (rl:vec2)))
    (true (rl:check-collision-lines '(0 0) '(10 10) '(0 10) '(10 0) point))
    (is equalp (rl:vec2 5 5) point "out parameter filled in")))

(define-test resources
  :parent raylib-tests
  (fail (rl:with-resources ((image (rl:load-image "no/such/file.png"))) image)
      'rl:resource-load-error)
  (let ((image (rl:gen-image-color 4 4 :red)))
    (true (rl:valid-p image))
    (rl:unload image)))

(define-test math
  :parent raylib-tests
  (is equalp (rl:vec2 4 6) (rl:v2+ (rl:vec2 1 2) (rl:vec2 3 4)))
  (is equalp (rl:vec2 0.6 0.8) (rl:v2-normalize (rl:vec2 3 4)))
  (is equalp (rl:vec2) (rl:v2-normalize (rl:vec2)))
  (is = 5 (rl:v2-distance (rl:vec2 0 0) (rl:vec2 3 4)))
  (is equalp (rl:vec2 5 10) (rl:v2-lerp (rl:vec2) (rl:vec2 10 20) 1/2))
  (true (rl:rect-contains-p (rl:rect 0 0 10 10) (rl:vec2 5 5)))
  (is equalp (rl:vec2 5 10) (rl:rect-center (rl:rect 0 0 10 20))))

;;; A real window

(define-test window
  :parent raylib-tests
  (asdf:load-system "raylib/examples")
  (let ((path (merge-pathnames "raylib-walker-test.png" (uiop:temporary-directory))))
    (uiop:delete-file-if-exists path)
    (setf rl:*last-error* nil)
    (rl:run (lambda () (uiop:symbol-call :raylib-examples :walker :frames 30 :screenshot path))
            :wait t)
    (false rl:*last-error*)
    (true (probe-file path) "the walker drew a frame")))
