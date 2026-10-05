;;;; types.lisp — argument conversions, enums and named colors

(in-package #:raylib)

;;; Numbers: raylib takes floats and ints; accept any real for either.

(declaim (inline to-int))
(defun to-int (value)
  (if (integerp value) value (round value)))

(cffi:define-foreign-type float-type () () (:actual-type :float) (:simple-parser %float))
(defmethod cffi:translate-to-foreign (value (type float-type)) (float value 1f0))
(defmethod cffi:expand-to-foreign (form (type float-type)) `(float ,form 1f0))

(cffi:define-foreign-type double-type () () (:actual-type :double) (:simple-parser %double))
(defmethod cffi:translate-to-foreign (value (type double-type)) (float value 1d0))
(defmethod cffi:expand-to-foreign (form (type double-type)) `(float ,form 1d0))

(cffi:define-foreign-type int-type () () (:actual-type :int) (:simple-parser %int))
(cffi:define-foreign-type uint-type () () (:actual-type :unsigned-int) (:simple-parser %uint))
(cffi:define-foreign-type uchar-type () () (:actual-type :unsigned-char) (:simple-parser %uchar))
(macrolet ((rounding (&rest classes)
             `(progn
                ,@(loop for class in classes
                        collect `(defmethod cffi:translate-to-foreign (value (type ,class)) (to-int value))
                        collect `(defmethod cffi:expand-to-foreign (form (type ,class)) `(to-int ,form))))))
  (rounding int-type uint-type uchar-type))

;;; Strings: a string, a pathname, or NIL for NULL.

(defun string-arg (value)
  (etypecase value
    (string value)
    (pathname (uiop:native-namestring (translate-logical-pathname value)))))

(defmacro with-string-arg ((var value) &body body)
  (let ((v (gensym "VALUE")))
    `(let ((,v ,value))
       (if (null ,v)
           (let ((,var (cffi:null-pointer))) ,@body)
           (cffi:with-foreign-string (,var (string-arg ,v)) ,@body)))))

(cffi:define-foreign-type string-type () () (:actual-type :pointer) (:simple-parser %string))
(defmethod cffi:translate-to-foreign (value (type string-type))
  (if value (values (cffi:foreign-string-alloc (string-arg value)) t) (cffi:null-pointer)))
(defmethod cffi:free-translated-object (pointer (type string-type) allocated)
  (when allocated (cffi:foreign-string-free pointer)))
(defmethod cffi:expand-to-foreign-dyn (value var body (type string-type))
  `(with-string-arg (,var ,value) ,@body))

;;; Enums: keywords, lists of keywords (OR'd together, for flags), or integers.

(defvar *enums* (make-hash-table :test 'eq)
  "Enum name -> (keyword-table . alist of (keyword . value)).")

(defmacro define-enum (name documentation &body values)
  "Define the enum NAME: VALUES are (keyword integer)."
  `(progn
     (setf (gethash ',name *enums*)
           (let ((table (make-hash-table :test 'eq)))
             (loop for (keyword value) in ',values
                   do (setf (gethash keyword table) value))
             (cons table ',(mapcar (lambda (v) (cons (first v) (second v))) values))))
     (setf (documentation ',name 'type) ,documentation)
     ',name))

(defun find-enum (enum)
  (or (gethash enum *enums*) (error "~s is not a raylib enum." enum)))

(defun %enum-lookup (enum value)
  (let ((table (car (find-enum enum))))
    (flet ((one (keyword)
             (or (gethash keyword table)
                 (error "~s is not a ~(~a~). Try one of:~%~{~s~^ ~}"
                        keyword enum (enum-keywords enum)))))
      (etypecase value
        (integer value)
        (keyword (one value))
        (list (reduce #'logior value :key (lambda (v) (if (integerp v) v (one v))) :initial-value 0))))))

(declaim (inline enum-value))
(defun enum-value (enum value)
  "The integer for VALUE in ENUM: VALUE is a keyword, a list of keywords
(OR'd together), or an integer. (enum-value 'keyboard-key :space) => 32"
  (if (typep value 'fixnum) value (%enum-lookup enum value)))

(defun enum-keyword (enum integer)
  "The keyword for INTEGER in ENUM, or NIL. (enum-keyword 'keyboard-key 32) => :SPACE"
  (car (rassoc integer (cdr (find-enum enum)))))

(defun enum-keywords (enum)
  "Every keyword ENUM accepts."
  (mapcar #'car (cdr (find-enum enum))))

(cffi:define-foreign-type enum-type ()
  ((enum :initarg :enum :reader enum-type-enum))
  (:actual-type :int))
(cffi:define-parse-method %enum (enum)
  (make-instance 'enum-type :enum enum))
(cffi:define-parse-method %uenum (enum)
  (make-instance 'enum-type :enum enum :actual-type :unsigned-int))
(defmethod cffi:translate-to-foreign (value (type enum-type))
  (enum-value (enum-type-enum type) value))
(defmethod cffi:expand-to-foreign (form (type enum-type))
  `(enum-value ',(enum-type-enum type) ,form))

;;; Named colors: raylib's palette, as keywords.

(defvar *colors* (make-hash-table :test 'eq)
  "Keyword -> (r g b a).")

(defmacro define-colors (&body colors)
  `(progn
     ,@(loop for (keyword . rgba) in colors
             collect `(setf (gethash ,keyword *colors*) ',rgba))
     nil))

(defun named-color (keyword)
  (or (gethash keyword *colors*)
      (error "~s is not a raylib color. Try one of:~%~{~s~^ ~}" keyword (color-keywords))))

(defun color-keywords ()
  "The color names raylib defines, as keywords: :red, :raywhite, ..."
  (sort (alexandria:hash-table-keys *colors*) #'string<))
