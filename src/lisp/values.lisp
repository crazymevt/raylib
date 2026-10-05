;;;; values.lisp — short constructors, colors and 2D vector math

(in-package #:raylib)

(declaim (inline vec2 vec3 rect))

(defun vec2 (&optional (x 0) (y 0))
  "A vector2 of X and Y."
  (make-vector2 :x (float x 1f0) :y (float y 1f0)))

(defun vec3 (&optional (x 0) (y 0) (z 0))
  "A vector3 of X, Y and Z."
  (make-vector3 :x (float x 1f0) :y (float y 1f0) :z (float z 1f0)))

(defun rect (x y width height)
  "A rectangle at X, Y of WIDTH and HEIGHT."
  (make-rectangle :x (float x 1f0) :y (float y 1f0)
                  :width (float width 1f0) :height (float height 1f0)))

(defun color (r &optional g b (a 255))
  "A color: (color 255 128 0), (color 255 128 0 100), (color :red), or
(color #xFF8000FF). Anywhere raylib takes a color, the keyword, the integer
or a list of numbers also work directly."
  (cond ((keywordp r)(apply #'make-color (mapcan #'list '(:r :g :b :a) (named-color r))))
        ((null g) (make-color :r (ldb (byte 8 24) r) :g (ldb (byte 8 16) r)
                              :b (ldb (byte 8 8) r) :a (ldb (byte 8 0) r)))
        (t (make-color :r r :g g :b b :a a))))

;;; 2D vector math on vector2s. Each returns a new vector.

(defun v2+ (a b)
  (vec2 (+ (vector2-x a) (vector2-x b)) (+ (vector2-y a) (vector2-y b))))

(defun v2- (a b)
  (vec2 (- (vector2-x a) (vector2-x b)) (- (vector2-y a) (vector2-y b))))

(defun v2* (v scale)
  (vec2 (* (vector2-x v) scale) (* (vector2-y v) scale)))

(defun v2/ (v divisor)
  (vec2 (/ (vector2-x v) divisor) (/ (vector2-y v) divisor)))

(defun v2-dot (a b)
  (+ (* (vector2-x a) (vector2-x b)) (* (vector2-y a) (vector2-y b))))

(defun v2-length-squared (v)
  (v2-dot v v))

(defun v2-length (v)
  (sqrt (v2-length-squared v)))

(defun v2-distance (a b)
  (v2-length (v2- a b)))

(defun v2-normalize (v)
  "V scaled to length 1; the zero vector stays zero."
  (let ((length (v2-length v)))
    (if (zerop length) (vec2) (v2/ v length))))

(defun v2-lerp (a b amount)
  "The point AMOUNT of the way from A to B: 0 is A, 1 is B."
  (v2+ a (v2* (v2- b a) amount)))

(defun v2-rotate (v radians)
  (let ((c (cos radians)) (s (sin radians)))
    (vec2 (- (* (vector2-x v) c) (* (vector2-y v) s))
          (+ (* (vector2-x v) s) (* (vector2-y v) c)))))

(defun v2-angle (v)
  "V's direction in radians, from the positive x axis (y points down on screen)."
  (atan (vector2-y v) (vector2-x v)))

(defun v2-zero-p (v)
  (and (zerop (vector2-x v)) (zerop (vector2-y v))))

;;; Rectangles

(defun rect-contains-p (rectangle point)
  "True if POINT, a vector2, is inside RECTANGLE."
  (let ((x (vector2-x point)) (y (vector2-y point)))
    (and (<= (rectangle-x rectangle) x (+ (rectangle-x rectangle) (rectangle-width rectangle)))
         (<= (rectangle-y rectangle) y (+ (rectangle-y rectangle) (rectangle-height rectangle))))))

(defun rect-center (rectangle)
  (vec2 (+ (rectangle-x rectangle) (/ (rectangle-width rectangle) 2))
        (+ (rectangle-y rectangle) (/ (rectangle-height rectangle) 2))))
