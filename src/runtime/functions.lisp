;;;; functions.lisp — DEFINE-FUNCTION, which the generated bindings use
;;;;
;;;; Parameter kinds: :float :double :int :uint :uchar :char :long :bool
;;;; :string :pointer (:enum name [:uint]) (:struct name) (:array-of name)
;;;; (:inout name). Return kinds: :void, the scalars, :string, :pointer,
;;;; (:struct name).
;;;;
;;;; A function with no struct values becomes a plain DEFCFUN. One that passes
;;;; or returns a struct by value calls its wrapper in the shim, rlshim_NAME,
;;;; which takes pointers; a Lisp function around it copies the structs.

(in-package #:raylib)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun struct-kind-p (kind)
    (and (consp kind) (eq (first kind) :struct)))

  (defun pointer-kind-p (kind)
    (and (consp kind) (member (first kind) '(:struct :array-of :inout))))

  (defun param-ctype (kind)
    (if (consp kind)
        (ecase (first kind)
          (:enum (if (eq (third kind) :uint) `(%uenum ,(second kind)) `(%enum ,(second kind))))
          ((:struct :array-of :inout) :pointer))
        (ecase kind
          (:float '%float) (:double '%double) (:int '%int) (:uint '%uint) (:uchar '%uchar)
          (:char :char) (:long :long) (:bool :bool) (:string '%string) (:pointer :pointer))))

  (defun return-ctype (kind)
    (if (struct-kind-p kind)
        :void
        (ecase kind
          (:void :void) (:float :float) (:double :double) (:int :int) (:uint :unsigned-int)
          (:uchar :unsigned-char) (:char :char) (:long :long) (:bool :bool)
          (:string :string) (:pointer :pointer))))

  (defun wrap-param (name kind body)
    "BODY, inside whatever passing NAME as KIND needs."
    (if (pointer-kind-p kind)
        `(,(ecase (first kind)
             (:struct 'with-struct-arg)
             (:array-of 'with-struct-array)
             (:inout 'with-struct-inout))
          (,name ,name ,(second kind))
          ,body)
        body)))

(defmacro define-function ((c-name lisp-name) return documentation &body params)
  "Define LISP-NAME calling the raylib function C-NAME. PARAMS are (name kind)."
  (let* ((names (mapcar #'first params))
         (kinds (mapcar #'second params))
         (shim (or (struct-kind-p return) (some #'struct-kind-p kinds)))
         (wrapper (or shim (some #'pointer-kind-p kinds))))
    (if (not wrapper)
        `(cffi:defcfun (,c-name ,lisp-name) ,(return-ctype return)
           ,documentation
           ,@(loop for name in names for kind in kinds
                   collect `(,name ,(param-ctype kind))))
        (let ((internal (symbolicate "%" lisp-name))
              (out (gensym "OUT")))
          `(progn
             (declaim (inline ,internal))
             (cffi:defcfun (,(if shim (concatenate 'string "rlshim_" c-name) c-name) ,internal)
                 ,(return-ctype return)
               ,@(loop for name in names for kind in kinds
                       collect `(,name ,(param-ctype kind)))
               ,@(when (struct-kind-p return) `((out :pointer))))
             (defun ,lisp-name ,names
               ,documentation
               ,(reduce (lambda (param body) (wrap-param (first param) (second param) body))
                        params
                        :from-end t
                        :initial-value
                        (if (struct-kind-p return)
                            `(cffi:with-foreign-object (,out '(:struct ,(second return)))
                               (,internal ,@names ,out)
                               (,(reader-name (second return)) ,out))
                            `(,internal ,@names)))))))))

(defmacro define-function-alias (alias name)
  "A name raylib keeps for compatibility."
  `(progn
     (setf (fdefinition ',alias) #',name)
     (setf (documentation ',alias 'function)
           ,(format nil "Old name for ~(~a~)." name))
     ',alias))
