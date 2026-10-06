;;;; threads.lisp — running a game on the main thread, from a REPL
;;;;
;;;; macOS only lets the process's first thread open windows. An editor's REPL
;;;; evaluates on another thread, so RUN hands the game to the main thread by
;;;; interrupting it, and returns at once: the REPL stays free for redefining
;;;; functions while the game runs.

(in-package #:raylib)

(defun main-thread-p ()
  "True when called on the process's first thread."
  #+sbcl (eq sb-thread:*current-thread* (sb-thread:main-thread))
  #-sbcl t)

(defvar *running* nil
  "True while a function started by RUN is running.")

(defvar *stop-requested* nil)
(defvar *resume-requested* nil)

(defvar *last-error* nil
  "The last error that ended a function started by RUN.")

(defun running-p ()
  "True while a game started by RUN is running."
  *running*)

(defun stop ()
  "Ask the running GAME-LOOP to finish after the current frame."
  (setf *stop-requested* t)
  (values))

(defun resume ()
  "Continue a GAME-LOOP paused by an error, after fixing the code (same as F5)."
  (setf *resume-requested* t)
  (values))

(defun call-in-game-context (function output)
  "Call FUNCTION with traps masked and output going to OUTPUT, recording errors."
  (let ((*standard-output* output)
        (*error-output* output)
        (*trace-output* output))
    (handler-bind ((error (lambda (e)
                            (setf *last-error* e)
                            (format output "~&;; raylib: ~a~%" e)
                            #+sbcl (sb-debug:print-backtrace :count 20 :stream output)
                            (finish-output output)
                            (return-from call-in-game-context nil))))
      #+sbcl (sb-int:with-float-traps-masked (:invalid :divide-by-zero :overflow :underflow :inexact)
               (funcall function))
      #-sbcl (funcall function))))

(defun run (function &key wait)
  "Call FUNCTION, a function of no arguments that opens a window, where raylib
can open one: on macOS, the main thread. From a REPL that runs elsewhere, RUN
returns at once and the game runs alongside the REPL; with WAIT, RUN waits
for it and returns its value. Output goes to the REPL. An error ends the run,
printing a backtrace and setting *LAST-ERROR*. Use (stop) to end a game loop.

  (rl:run 'my-game)"
  (when *running*
    (error "A game is already running. Call (rl:stop) first."))
  (setf *running* t *stop-requested* nil *resume-requested* nil)
  (let* ((output *standard-output*)
         (done #+sbcl (sb-thread:make-semaphore) #-sbcl nil)
         (result nil)
         (job (lambda ()
                (unwind-protect (setf result (call-in-game-context function output))
                  (setf *running* nil)
                  #+sbcl (sb-thread:signal-semaphore done)))))
    (when (main-thread-p)
      (funcall job)
      (return-from run result))
    #+(and sbcl darwin)
    (sb-thread:interrupt-thread (sb-thread:main-thread)
                                (lambda () (sb-sys:with-interrupts (funcall job))))
    #+(and sbcl (not darwin))
    (sb-thread:make-thread job :name "raylib")
    (if wait
        (progn #+sbcl (sb-thread:wait-on-semaphore done) result)
        (values))))

;;; After the window closes (macOS)
;;;
;;; GLFW closes a window on macOS only once its events are handled, and the
;;; process stays the active app. Run from an editor's Lisp, the main thread
;;; then goes back to reading standard input and handles no events, so the
;;; closed window stays on screen with a spinning wheel. CLOSE-WINDOW is
;;; followed by RELEASE-APP: handle what's pending, and stop being an app
;;; (no Dock icon), which gives activation back to the one used before.
;;; PREPARE-APP undoes that before the next window opens.

#+darwin
(progn
  (defun objc-class (name) (cffi:foreign-funcall "objc_getClass" :string name :pointer))
  (defun objc-selector (name) (cffi:foreign-funcall "sel_registerName" :string name :pointer))

  (defun shared-application ()
    "NSApp, or NIL if this process has never made one."
    (let ((class (objc-class "NSApplication")))
      (unless (cffi:null-pointer-p class)
        (let ((app (cffi:foreign-funcall "objc_msgSend" :pointer class
                                                        :pointer (objc-selector "sharedApplication") :pointer)))
          (unless (cffi:null-pointer-p app) app)))))

  (defun set-activation-policy (app policy)
    "POLICY: 0 regular (Dock icon, menu bar), 2 prohibited (neither)."
    (cffi:foreign-funcall "objc_msgSend" :pointer app :pointer (objc-selector "setActivationPolicy:")
                                         :long policy :boolean))

  (defun handle-pending-events (app &key (seconds 0.3))
    "Handle the window-system events that arrive within SECONDS."
    (let ((mode (cffi:mem-ref (cffi:foreign-symbol-pointer "NSDefaultRunLoopMode") :pointer))
          (past (cffi:foreign-funcall "objc_msgSend" :pointer (objc-class "NSDate")
                                                     :pointer (objc-selector "distantPast") :pointer))
          (next (objc-selector "nextEventMatchingMask:untilDate:inMode:dequeue:"))
          (send (objc-selector "sendEvent:")))
      (loop repeat (max 1 (round seconds 0.02))
            do (let ((pool (cffi:foreign-funcall "objc_autoreleasePoolPush" :pointer)))
                 (loop for event = (cffi:foreign-funcall "objc_msgSend" :pointer app :pointer next
                                                                        :unsigned-long-long #xFFFFFFFFFFFFFFFF
                                                                        :pointer past :pointer mode :boolean t
                                                                        :pointer)
                       until (cffi:null-pointer-p event)
                       do (cffi:foreign-funcall "objc_msgSend" :pointer app :pointer send :pointer event :void))
                 (cffi:foreign-funcall "objc_autoreleasePoolPop" :pointer pool :void))
               (sleep 0.02)))))

(defun prepare-app ()
  "Before a window opens: be a regular app again, if RELEASE-APP made this one stop."
  #+darwin (ignore-errors
            (let ((app (shared-application)))
              (when app (set-activation-policy app 0))))
  (values))

(defun release-app ()
  "After the window closes: let it go from the screen, and stop being the active app."
  #+darwin (ignore-errors
            (let ((app (shared-application)))
              (when app
                (handle-pending-events app)
                (set-activation-policy app 2)
                (handle-pending-events app :seconds 0.1))))
  (values))
