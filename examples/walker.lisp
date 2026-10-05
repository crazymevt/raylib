;;;; walker.lisp — walk a dot around a checkered field, with a following camera
;;;;
;;;; (ql:quickload :raylib/examples)
;;;; (rl:run 'raylib-examples:walker)
;;;;
;;;; While it runs, redefine UPDATE-PLAYER or DRAW-WORLD in the REPL and the
;;;; game changes on the next frame. Break one on purpose to see the game
;;;; pause; fix it and press F5.

(defpackage #:raylib-examples
  (:use #:cl)
  (:export #:walker))

(in-package #:raylib-examples)

(defparameter *speed* 240 "Pixels per second.")

(defvar *player* (rl:vec2))
(defvar *camera* (rl:make-camera-2d))

(defun direction ()
  "The unit vector the arrow keys or WASD point in."
  (flet ((pressed (&rest keys) (if (some #'rl:is-key-down keys) 1 0)))
    (rl:v2-normalize (rl:vec2 (- (pressed :right :d) (pressed :left :a))
                              (- (pressed :down :s) (pressed :up :w))))))

(defun update-player (dt)
  (setf *player* (rl:v2+ *player* (rl:v2* (direction) (* *speed* dt))))
  (setf (rl:camera-2d-target *camera*) *player*))

(defun draw-world (tile)
  (loop for x from -12 below 12
        do (loop for y from -12 below 12
                 do (rl:draw-texture tile (* x 64) (* y 64)
                                     (if (evenp (+ x y)) :white :lightgray))))
  (rl:draw-circle-v *player* 14 :maroon)
  (rl:draw-circle-v (rl:v2+ *player* (rl:v2* (direction) 10)) 5 :gold))

(defun draw-hud ()
  (rl:draw-rectangle 0 0 (rl:get-screen-width) 36 '(0 0 0 140))
  (rl:draw-text "Arrows or WASD to walk, Esc to quit" 10 9 20 :raywhite)
  (rl:draw-fps (- (rl:get-screen-width) 90) 9))

(defun make-tile ()
  (let ((image (rl:gen-image-checked 64 64 16 16 :darkgreen :lime)))
    (prog1 (rl:load-texture-from-image image)
      (rl:unload-image image))))

(defun save-screen (path)
  "Write what has been drawn this frame to PATH. Call before the frame ends."
  (rl:end-scissor-mode)                 ; flushes raylib's batch of pending draws
  (let ((image (rl:load-image-from-screen)))
    (rl:export-image image path)
    (rl:unload-image image)))

(defun walker (&key frames screenshot)
  "Open the window and walk. FRAMES ends it after that many frames;
SCREENSHOT saves the last frame to that path."
  (setf *player* (rl:vec2)
        *camera* (rl:make-camera-2d :offset (rl:vec2 400 240)))
  (rl:with-window (800 480 "raylib walker")
    (rl:with-resources ((tile (make-tile)))
      (let ((frame 0))
        (rl:game-loop (dt)
          (update-player dt)
          (rl:with-drawing (:darkgray)
            (rl:with-mode-2d (*camera*)
              (draw-world tile))
            (draw-hud)
            (when (and frames (>= (incf frame) frames))
              (when screenshot (save-screen screenshot))
              (rl:stop))))))))
