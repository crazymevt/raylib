;;;; structs.lisp — raylib's C structs as Lisp structures
;;;;
;;;; Every raylib struct is a Lisp structure with the same fields, copied into
;;;; C memory for a call and out of it for a result. raylib treats its structs
;;;; as values (a Texture is an id and a size), so copying matches its design.
;;;;
;;;; Field kinds: :float :int :uint :uchar :bool :pointer (:enum name)
;;;; (:struct name) (:array kind count) (:string count).

(in-package #:raylib)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun symbolicate (&rest parts)
    (intern (format nil "~{~a~}" parts) '#:raylib))

  (defun writer-name (struct) (symbolicate "%WRITE-" struct))
  (defun reader-name (struct) (symbolicate "%READ-" struct))
  (defun reader-into-name (struct) (symbolicate "%READ-" struct "-INTO"))

  (defun kind-ctype (kind)
    "The CFFI type of one element of KIND."
    (if (consp kind)
        (ecase (first kind)
          (:struct `(:struct ,(second kind)))
          (:enum :int)
          (:array (kind-ctype (second kind)))
          (:string :char))
        (ecase kind
          (:float :float) (:int :int) (:uint :unsigned-int) (:uchar :unsigned-char)
          (:bool :uint8) (:pointer :pointer))))

  (defun kind-count (kind)
    (when (and (consp kind) (member (first kind) '(:array :string)))
      (car (last kind))))

  (defun kind-initform (kind)
    (if (consp kind)
        (ecase (first kind)
          (:struct `(,(symbolicate "MAKE-" (second kind))))
          (:enum 0)
          (:string "")
          (:array `(let ((a (make-array ,(third kind))))
                     (dotimes (i ,(third kind) a)
                       (setf (aref a i) ,(kind-initform (second kind)))))))
        (ecase kind
          (:float 0.0) ((:int :uint :uchar) 0) (:bool nil) (:pointer '(cffi:null-pointer)))))

  (defun kind-writer (kind value pointer)
    "A form storing the Lisp VALUE at POINTER, as KIND."
    (if (consp kind)
        (ecase (first kind)
          (:struct `(,(writer-name (second kind)) ,value ,pointer))
          (:enum `(setf (cffi:mem-ref ,pointer :int) (enum-value ',(second kind) ,value)))
          (:string `(cffi:lisp-string-to-foreign ,value ,pointer ,(second kind)))
          (:array (let ((seq (gensym "SEQ")) (i (gensym "I")))
                    `(let ((,seq ,value))
                       (dotimes (,i ,(third kind))
                         ,(kind-writer (second kind) `(elt ,seq ,i)
                                       `(cffi:mem-aptr ,pointer ',(kind-ctype (second kind)) ,i)))))))
        (ecase kind
          (:float `(setf (cffi:mem-ref ,pointer :float) (float ,value 1f0)))
          (:int `(setf (cffi:mem-ref ,pointer :int) (to-int ,value)))
          (:uint `(setf (cffi:mem-ref ,pointer :unsigned-int) (to-int ,value)))
          (:uchar `(setf (cffi:mem-ref ,pointer :unsigned-char) (to-int ,value)))
          (:bool `(setf (cffi:mem-ref ,pointer :uint8) (if ,value 1 0)))
          (:pointer `(setf (cffi:mem-ref ,pointer :pointer) (or ,value (cffi:null-pointer)))))))

  (defun kind-reader (kind pointer)
    "A form reading KIND at POINTER as a Lisp value."
    (if (consp kind)
        (ecase (first kind)
          (:struct `(,(reader-name (second kind)) ,pointer))
          (:enum `(cffi:mem-ref ,pointer :int))
          (:string `(cffi:foreign-string-to-lisp ,pointer :max-chars ,(second kind)))
          (:array (let ((a (gensym "A")) (i (gensym "I")))
                    `(let ((,a (make-array ,(third kind))))
                       (dotimes (,i ,(third kind) ,a)
                         (setf (aref ,a ,i)
                               ,(kind-reader (second kind)
                                             `(cffi:mem-aptr ,pointer ',(kind-ctype (second kind)) ,i))))))))
        (ecase kind
          (:float `(cffi:mem-ref ,pointer :float))
          (:int `(cffi:mem-ref ,pointer :int))
          (:uint `(cffi:mem-ref ,pointer :unsigned-int))
          (:uchar `(cffi:mem-ref ,pointer :unsigned-char))
          (:bool `(/= 0 (cffi:mem-ref ,pointer :uint8)))
          (:pointer `(cffi:mem-ref ,pointer :pointer)))))

  (defun numeric-kind-p (kind)
    (member kind '(:float :int :uint :uchar))))

(defmacro define-struct (name documentation &body fields)
  "Define the raylib struct NAME: a CFFI struct, a Lisp structure with the same
fields, and %WRITE-NAME / %READ-NAME / %READ-NAME-INTO to copy between them.
FIELDS are (field kind &key initform). Structs of only numbers (vectors,
rectangles, colors, matrices) can also be written from a list or vector of
numbers; colors also from a keyword (:red) or an integer #xRRGGBBAA."
  (let* ((names (mapcar #'first fields))
         (kinds (mapcar #'second fields))
         (accessors (mapcar (lambda (f) (symbolicate name "-" f)) names))
         (numeric (every #'numeric-kind-p kinds))
         (value (gensym "VALUE"))
         (pointer (gensym "POINTER")))
    (flet ((slot-pointer (field)
             `(cffi:foreign-slot-pointer ,pointer '(:struct ,name) ',field))
           (write-each (getter)
             (loop for field in names for kind in kinds for i from 0
                   collect (kind-writer kind (funcall getter i) `(cffi:foreign-slot-pointer ,pointer '(:struct ,name) ',field)))))
      `(progn
         (cffi:defcstruct ,name
           ,@(loop for field in names for kind in kinds
                   collect `(,field ,(kind-ctype kind) ,@(let ((n (kind-count kind))) (when n `(:count ,n))))))
         (defstruct ,name
           ,documentation
           ,@(loop for (field kind . options) in fields
                   collect `(,field ,(getf options :initform (kind-initform kind)))))
         (defun ,(writer-name name) (,value ,pointer)
           (etypecase ,value
             (,name ,@(write-each (lambda (i) `(,(nth i accessors) ,value))))
             ,@(when (eq name 'color)
                 `((keyword (,(writer-name name) (named-color ,value) ,pointer))
                   (integer (,(writer-name name)
                             (list (ldb (byte 8 24) ,value) (ldb (byte 8 16) ,value)
                                   (ldb (byte 8 8) ,value) (ldb (byte 8 0) ,value))
                             ,pointer))))
             ,@(when numeric
                 `((sequence
                    (unless (or (= (length ,value) ,(length names))
                                ,@(when (eq name 'color) `((= (length ,value) 3))))
                      (error "A ~(~a~) needs ~d numbers, not ~s." ',name ,(length names) ,value))
                    ,@(write-each (lambda (i)
                                    (if (and (eq name 'color) (= i 3))
                                        `(if (> (length ,value) 3) (elt ,value 3) 255)
                                        `(elt ,value ,i))))))))
           ,pointer)
         (defun ,(reader-name name) (,pointer)
           (,(symbolicate "MAKE-" name)
            ,@(loop for field in names for kind in kinds
                    collect (intern (symbol-name field) :keyword)
                    collect (kind-reader kind (slot-pointer field)))))
         (defun ,(reader-into-name name) (,value ,pointer)
           (setf ,@(loop for field in names for kind in kinds for accessor in accessors
                         collect `(,accessor ,value)
                         collect (kind-reader kind (slot-pointer field))))
           ,value)
         ',name))))

(defmacro define-struct-alias (alias name)
  "raylib's typedef names: Texture2D for Texture, Camera for Camera3D, ..."
  `(progn
     (deftype ,alias () ',name)
     (setf (fdefinition ',(symbolicate "MAKE-" alias)) #',(symbolicate "MAKE-" name))
     ',alias))

;;; Checking the layouts against C

(cffi:defcfun ("rlshim_struct_size" %struct-size) :int (index :int))

(defvar *struct-order* '()
  "The structs in shim.c's order, for checking layouts.")

(defun check-struct-sizes ()
  "Signal an error if a struct's size in Lisp differs from C's, which would
mean the bindings don't match the raylib they're loaded with."
  (let ((bad (loop for name in *struct-order* for i from 0
                   for lisp = (cffi:foreign-type-size `(:struct ,name))
                   for c = (%struct-size i)
                   unless (= lisp c) collect (list name lisp c))))
    (when bad
      (error "raylib struct layouts don't match C:~%~:{  ~(~a~): ~d bytes in Lisp, ~d in C~%~}" bad))))

(defmacro define-struct-order (&rest names)
  `(progn (setf *struct-order* ',names)
          (check-struct-sizes)))

;;; Passing structs to C

(defmacro with-struct-arg ((var value struct) &body body)
  "Bind VAR to a pointer to VALUE copied into C memory as STRUCT. A pointer
passes through unchanged."
  (let ((buffer (gensym "BUFFER")) (v (gensym "VALUE")))
    `(cffi:with-foreign-object (,buffer '(:struct ,struct))
       (let* ((,v ,value)
              (,var (if (cffi:pointerp ,v) ,v (,(writer-name struct) ,v ,buffer))))
         ,@body))))

(defmacro with-struct-array ((var value struct) &body body)
  "Bind VAR to a C array of STRUCT holding the elements of the sequence VALUE.
A pointer passes through, NIL becomes NULL."
  (let ((buffer (gensym "BUFFER")) (v (gensym "VALUE")) (i (gensym "I")))
    `(let ((,v ,value))
       (if (or (null ,v) (cffi:pointerp ,v))
           (let ((,var (or ,v (cffi:null-pointer)))) ,@body)
           (cffi:with-foreign-object (,buffer '(:struct ,struct) (max 1 (length ,v)))
             (let ((,i 0))
               (map nil (lambda (element)
                          (,(writer-name struct) element (cffi:mem-aptr ,buffer '(:struct ,struct) ,i))
                          (incf ,i))
                    ,v))
             (let ((,var ,buffer)) ,@body))))))

(defmacro with-struct-inout ((var value struct) &body body)
  "Bind VAR to a pointer to VALUE copied into C memory, and after BODY copy the
C struct back into VALUE, which the function updated. A pointer passes
through, NIL becomes NULL."
  (let ((buffer (gensym "BUFFER")) (v (gensym "VALUE")))
    `(let ((,v ,value))
       (if (or (null ,v) (cffi:pointerp ,v))
           (let ((,var (or ,v (cffi:null-pointer)))) ,@body)
           (cffi:with-foreign-object (,buffer '(:struct ,struct))
             (,(writer-name struct) ,v ,buffer)
             (multiple-value-prog1 (let ((,var ,buffer)) ,@body)
               (,(reader-into-name struct) ,v ,buffer)))))))
