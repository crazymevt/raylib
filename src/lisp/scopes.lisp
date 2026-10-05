;;;; scopes.lisp — the window, drawing scopes, and the game loop

(in-package #:raylib)

(defmacro with-float-traps-masked (&body body)
  "SBCL traps floating-point errors that graphics drivers trip routinely."
  #+sbcl `(sb-int:with-float-traps-masked (:invalid :divide-by-zero :overflow :underflow :inexact)
            ,@body)
  #-sbcl `(progn ,@body))

(defun call-with-window (function width height title &key (fps 60) flags (exit-key :escape) (log-level :warning))
  #+darwin (unless (main-thread-p)
             (error "On macOS raylib can only open a window on the main thread. ~
                     From the REPL, start your game with (rl:run 'my-game)."))
  (set-trace-log-level log-level)
  (when flags (set-config-flags flags))
  (with-float-traps-masked
    (init-window width height title)
    (unwind-protect
         (progn
           (unless (is-window-ready)
             (error "raylib couldn't open a window."))
           (when fps (set-target-fps fps))
           (set-exit-key (or exit-key :null))
           (funcall function))
      (close-window))))

(defmacro with-window ((width height title &rest options &key fps flags exit-key log-level) &body body)
  "Open a WIDTH x HEIGHT window titled TITLE, run BODY, and close it.
FPS (default 60) sets the target frame rate, NIL for none. FLAGS are config
flags such as (:window-resizable :msaa-4x-hint). EXIT-KEY (default :escape)
closes the window, NIL for none. LOG-LEVEL (default :warning) filters
raylib's messages, which go to the process's standard output."
  (declare (ignore fps flags exit-key log-level))
  `(call-with-window (lambda () ,@body) ,width ,height ,title ,@options))

(defmacro with-drawing ((&optional clear-color) &body body)
  "Draw a frame: BODY between begin-drawing and end-drawing, clearing the screen
to CLEAR-COLOR first if given."
  `(progn
     (begin-drawing)
     (unwind-protect
          (progn ,@(when clear-color `((clear-background ,clear-color)))
                 ,@body)
       (end-drawing))))

(macrolet ((define-scope (name (&rest args) begin end documentation)
             `(defmacro ,name ((,@args) &body body)
                ,documentation
                (list 'progn
                      (list ',begin ,@args)
                      (list* 'unwind-protect (cons 'progn body) '((,end)))))))
  (define-scope with-mode-2d (camera) begin-mode-2d end-mode-2d
    "Draw BODY through CAMERA, a camera-2d.")
  (define-scope with-mode-3d (camera) begin-mode-3d end-mode-3d
    "Draw BODY in 3D through CAMERA, a camera-3d.")
  (define-scope with-texture-mode (target) begin-texture-mode end-texture-mode
    "Draw BODY into TARGET, a render-texture, instead of the screen.")
  (define-scope with-shader-mode (shader) begin-shader-mode end-shader-mode
    "Draw BODY with SHADER.")
  (define-scope with-blend-mode (mode) begin-blend-mode end-blend-mode
    "Draw BODY with the blend MODE, such as :additive.")
  (define-scope with-scissor-mode (x y width height) begin-scissor-mode end-scissor-mode
    "Draw BODY clipped to the rectangle X, Y, WIDTH, HEIGHT."))

(defmacro with-audio-device (() &body body)
  "Run BODY with the audio device open, needed to load and play sounds and music."
  `(progn
     (init-audio-device)
     (unwind-protect (progn ,@body)
       (close-audio-device))))

;;; The game loop

(defun report-game-error (condition)
  (setf *last-error* condition)
  (format *error-output* "~&;; Error in the game loop: ~a~%" condition)
  #+sbcl (sb-debug:print-backtrace :count 15 :stream *error-output*)
  (format *error-output* "~&;; Paused. Fix the code, then press F5 in the game or call (rl:resume).~%")
  (finish-output *error-output*))

(defun wrap-text (text width)
  (loop for line in (uiop:split-string text :separator '(#\Newline))
        append (or (loop for start from 0 below (length line) by width
                         collect (subseq line start (min (length line) (+ start width))))
                   (list ""))))

(defun draw-error-screen (condition)
  (with-drawing ('(48 16 24))
    (draw-text "Error in the game loop" 20 20 24 :white)
    (loop for line in (wrap-text (princ-to-string condition) 72)
          for y from 64 by 22
          repeat 16
          do (draw-text line 20 y 18 :raywhite))
    (draw-text "Fix the code, then press F5 or call (rl:resume). Esc quits."
               20 (- (get-screen-height) 40) 18 :gold)))

(defun call-with-game-loop (function on-error)
  (setf *stop-requested* nil *resume-requested* nil)
  (let ((paused nil))
    (loop until (or (window-should-close) *stop-requested*)
          do (cond (paused
                    (draw-error-screen paused)
                    (when (or *resume-requested* (is-key-pressed :f5))
                      (setf paused nil *resume-requested* nil)))
                   ((eq on-error :pause)
                    (block frame
                      (handler-bind ((error (lambda (e)
                                              (report-game-error e)
                                              (setf paused e)
                                              (return-from frame))))
                        (funcall function (get-frame-time)))))
                   (t (funcall function (get-frame-time)))))))

(defmacro game-loop ((&optional (dt (gensym "DT")) &key (on-error :pause)) &body body)
  "Run BODY once per frame until the window closes or (rl:stop) is called,
with DT bound to the seconds since the last frame.

An error pauses the game instead of ending it: the window shows the error,
and after you fix the code, F5 or (rl:resume) carries on from the next frame.
Keep the work in named functions called from BODY, so redefining them in the
REPL changes the running game. ON-ERROR :signal lets errors through instead."
  `(call-with-game-loop (lambda (,dt) (declare (ignorable ,dt)) ,@body) ,on-error))
