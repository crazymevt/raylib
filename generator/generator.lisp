;;;; generator.lisp — read raylib_api.json, write src/generated/raylib.lisp and shim.c
;;;;
;;;; The generated Lisp is declarative (DEFINE-ENUM, DEFINE-STRUCT,
;;;; DEFINE-FUNCTION, ...); the macros in src/runtime/ turn it into code. The
;;;; shim is C: one wrapper per function that takes or returns a struct by
;;;; value, taking pointers instead, so Lisp never needs libffi.

(in-package #:raylib.generator)

;;; Reading the API description

(defun system-file (name)
  (asdf:system-relative-pathname "raylib-generator" name))

(defun fix-json (text)
  "raylib's rlparser doesn't escape quotes inside descriptions, which breaks the
JSON (6.0: LoadDirectoryFilesEx). Escape stray quotes on description lines."
  (with-output-to-string (out)
    (with-input-from-string (in text)
      (loop for line = (read-line in nil)
            while line
            do (multiple-value-bind (match groups)
                   (cl-ppcre:scan-to-strings "^(\\s*\"description\": \")(.*)(\",?)$" line)
                 (write-line
                  (if match
                      (concatenate 'string (aref groups 0)
                                   (cl-ppcre:regex-replace-all "(?<!\\\\)\"" (aref groups 1) "\\\\\"")
                                   (aref groups 2))
                      line)
                  out))))))

(defun load-api (&optional (path (system-file "spec/raylib_api.json")))
  (com.inuoe.jzon:parse (fix-json (uiop:read-file-string path))))

(defun j (object &rest keys)
  (dolist (key keys object)
    (setf object (gethash key object))))

(defun jlist (object key)
  (coerce (or (gethash key object) #()) 'list))

;;; Naming

(defun lisp-name (c-name)
  "DrawTextureV -> draw-texture-v, Vector2Add -> vector2-add, BeginMode2D ->
begin-mode-2d, GetFPS -> get-fps, NPatchInfo -> n-patch-info, offsetX -> offset-x."
  (let* ((s (cl-ppcre:regex-replace-all "([0-9])D(?![a-z])" c-name "_\\1d_"))
         (s (cl-ppcre:regex-replace-all "([a-z0-9])([A-Z])" s "\\1_\\2"))
         (s (cl-ppcre:regex-replace-all "([A-Z]+)([A-Z][a-z])" s "\\1_\\2"))
         (s (cl-ppcre:regex-replace-all "_+" s "-")))
    (string-downcase (string-trim "-" s))))

(defparameter *cl-specials*
  (let (names)
    (do-external-symbols (s :cl names)
      (when (and (boundp s) (or (constantp s) (char= #\* (char (symbol-name s) 0))))
        (push (string-downcase (symbol-name s)) names))))
  "Names that can't be used as parameter names: CL constants and specials.")

(defun param-name (c-name)
  (let ((name (lisp-name c-name)))
    (if (member name *cl-specials* :test #'string=)
        (concatenate 'string name "-value")
        name)))

(defun enum-keyword (value-name prefix)
  (substitute #\- #\_ (string-downcase (subseq value-name (length prefix)))))

(defun common-prefix (names)
  "Longest prefix shared by NAMES, cut back to just after an underscore."
  (let* ((first (first names))
         (end (reduce #'min (mapcar (lambda (n) (or (mismatch first n) (length n))) (rest names))
                      :initial-value (length first))))
    (subseq first 0 (1+ (or (position #\_ first :end end :from-end t) -1)))))

;;; The model: structs, aliases and enums by C name

(defvar *api*)
(defvar *structs*)   ; C name -> struct object
(defvar *aliases*)   ; C alias name -> C target name (pointer typedefs excluded)
(defvar *pointer-typedefs*)
(defvar *callbacks*)

(defun index-api (api)
  (setf *api* api
        *structs* (make-hash-table :test 'equal)
        *aliases* (make-hash-table :test 'equal)
        *pointer-typedefs* '()
        *callbacks* (mapcar (lambda (c) (j c "name")) (jlist api "callbacks")))
  (dolist (s (jlist api "structs"))
    (setf (gethash (j s "name") *structs*) s))
  (dolist (a (jlist api "aliases"))
    (let ((name (j a "name")))
      (if (char= #\* (char name 0))
          (push (subseq name 1) *pointer-typedefs*)
          (setf (gethash name *aliases*) (j a "type"))))))

(defparameter *struct-renames* '(("ModelSkeleton" . "skeleton"))
  "Lisp names for structs whose usual name would collide with an accessor.")

(defparameter *field-renames*
  '((("Image" . "format") . "pixel-format") (("Image" . "mipmaps") . "mipmap-count")
    (("Texture" . "format") . "pixel-format") (("Texture" . "mipmaps") . "mipmap-count"))
  "Lisp slot names for fields whose accessor would collide with a function
(IMAGE-FORMAT, IMAGE-MIPMAPS); Texture follows Image for consistency.")

(defun struct-lisp-name (c-name)
  (or (cdr (assoc c-name *struct-renames* :test #'string=)) (lisp-name c-name)))

(defun field-lisp-name (struct field)
  (or (cdr (assoc (cons struct field) *field-renames* :test #'equal)) (lisp-name field)))

(defun struct-name (c-type)
  "The canonical C struct name C-TYPE denotes, or NIL."
  (let ((target (gethash c-type *aliases* c-type)))
    (and (gethash target *structs*) target)))

;;; Types

(defparameter *param-enums*
  '(("key" . "KeyboardKey") ("axis" . "GamepadAxis") ("cursor" . "MouseCursor")
    ("filter" . "TextureFilter") ("wrap" . "TextureWrap") ("layout" . "CubemapLayout")
    ("gesture" . "Gesture") ("logLevel" . "TraceLogLevel") ("mapType" . "MaterialMapIndex")
    ("uniformType" . "ShaderUniformDataType") ("format" . "PixelFormat")
    ("newFormat" . "PixelFormat") ("flag" . "ConfigFlags") ("flags" . "ConfigFlags"))
  "Integer parameters that take an enum, by parameter name.")

(defun param-enum (function param)
  "The C enum name an int parameter takes, or NIL."
  (flet ((starts (prefix) (eql 0 (search prefix function))))
    (cond ((string= param "button")
           (cond ((starts "IsGamepadButton") "GamepadButton")
                 ((starts "IsMouseButton") "MouseButton")))
          ((string= param "mode")
           (cond ((string= function "BeginBlendMode") "BlendMode")
                 ((string= function "UpdateCamera") "CameraMode")))
          ((and (string= param "flags") (string= function "SetGesturesEnabled")) "Gesture")
          ((and (string= param "type") (string= function "LoadFontData")) "FontType")
          (t (cdr (assoc param *param-enums* :test #'string=))))))

(defparameter *field-enums*
  '((("Camera3D" . "projection") . "CameraProjection")
    (("NPatchInfo" . "layout") . "NPatchLayout")
    (("Image" . "format") . "PixelFormat")
    (("Texture" . "format") . "PixelFormat")))

(defparameter *inout-params*
  '("image" "dst" "camera" "texture" "mesh" "material" "model" "wave" "collisionPoint")
  "Non-const struct pointer parameters naming one struct the function updates in place.")

(defparameter *scalars*
  '(("float" . ":float") ("double" . ":double") ("int" . ":int") ("unsigned int" . ":uint")
    ("unsigned char" . ":uchar") ("char" . ":char") ("long" . ":long") ("bool" . ":bool")))

(defun lisp-struct (c-type)
  (struct-lisp-name (struct-name c-type)))

(defun pointee (c-type)
  "For \"const Vector2 *\" return (values \"Vector2\" T); NIL unless a single pointer."
  (let ((const (eql 0 (search "const " c-type)))
        (base (string-trim " " (remove #\* (cl-ppcre:regex-replace "^const " c-type "")))))
    (when (= 1 (count #\* c-type))
      (values base const))))

(defun param-kind (function c-type c-name)
  "The kind notation DEFINE-FUNCTION understands, as a string."
  (let ((scalar (cdr (assoc c-type *scalars* :test #'string=))))
    (cond ((and (member c-type '("int" "unsigned int") :test #'string=)
                (param-enum function c-name))
           (format nil "(:enum ~a~:[~; :uint~])" (lisp-name (param-enum function c-name))
                   (string= c-type "unsigned int")))
          (scalar scalar)
          ((string= c-type "const char *") ":string")
          ((struct-name c-type) (format nil "(:struct ~a)" (lisp-struct c-type)))
          ((member c-type *pointer-typedefs* :test #'string=) ":pointer")
          ((member c-type *callbacks* :test #'string=) ":pointer")
          ((find #\* c-type)
           (multiple-value-bind (base const) (pointee c-type)
             (cond ((and base (struct-name base) const)
                    (format nil "(:array-of ~a)" (lisp-struct base)))
                   ((and base (struct-name base) (member c-name *inout-params* :test #'string=))
                    (format nil "(:inout ~a)" (lisp-struct base)))
                   (t ":pointer"))))
          (t (error "No mapping for parameter type ~s (~a ~a)" c-type function c-name)))))

(defun return-kind (function)
  (let ((c-type (j function "returnType"))
        (name (j function "name")))
    (cond ((string= c-type "void") ":void")
          ((assoc c-type *scalars* :test #'string=) (cdr (assoc c-type *scalars* :test #'string=)))
          ((string= c-type "const char *") ":string")
          ((string= c-type "char *")
           ;; Text functions return static buffers, except loaders and *Alloc ones.
           (if (or (eql 0 (search "Load" name))
                   (let ((e (search "Alloc" name :from-end t))) (and e (= e (- (length name) 5))))
                   (search "MemFree" (j function "description")))
               ":pointer"
               ":string"))
          ((struct-name c-type) (format nil "(:struct ~a)" (lisp-struct c-type)))
          ((find #\* c-type) ":pointer")
          ((member c-type *pointer-typedefs* :test #'string=) ":pointer")
          (t (error "No mapping for return type ~s (~a)" c-type name)))))

(defun field-kind (struct c-type c-name)
  (let ((enum (cdr (assoc (cons struct c-name) *field-enums* :test #'equal)))
        (scalar (cdr (assoc c-type *scalars* :test #'string=))))
    (multiple-value-bind (match groups) (cl-ppcre:scan-to-strings "^(.*)\\[(\\d+)\\]$" c-type)
      (cond (enum (format nil "(:enum ~a)" (lisp-name enum)))
            ((and match (string= (aref groups 0) "char"))
             (format nil "(:string ~a)" (aref groups 1)))
            (match (format nil "(:array ~a ~a)"
                           (field-kind struct (aref groups 0) c-name) (aref groups 1)))
            (scalar scalar)
            ((struct-name c-type) (format nil "(:struct ~a)" (lisp-struct c-type)))
            ((or (find #\* c-type) (member c-type *pointer-typedefs* :test #'string=)) ":pointer")
            (t (error "No mapping for field type ~s (~a.~a)" c-type struct c-name))))))

(defun struct-kind-p (kind)
  (eql 0 (search "(:struct " kind)))

;;; Overrides

(defparameter *field-initforms*
  '((("Color" . "a") . "255")
    (("Camera2D" . "zoom") . "1.0")
    (("Camera3D" . "up") . "(make-vector3 :y 1.0)")
    (("Camera3D" . "fovy") . "45.0"))
  "Slot defaults better than zero.")

(defparameter *skipped-functions* '("TraceLog" "TextFormat")
  "Variadic: use FORMAT in Lisp.")

(defun api-functions (api)
  "The functions to bind."
  (remove-if (lambda (f) (member (j f "name") *skipped-functions* :test #'string=))
             (jlist api "functions")))

;;; Emitting Lisp

(defun c-signature (function)
  (format nil "~a ~a(~{~a~^, ~})"
          (j function "returnType") (j function "name")
          (mapcar (lambda (p)
                    (let ((type (j p "type")))
                      (format nil "~a~:[ ~;~]~a" type (char= #\* (char type (1- (length type)))) (j p "name"))))
                  (jlist function "params"))))

(defun docstring (description &optional c-line)
  (let ((text (string-trim " " (or description ""))))
    (when (and (plusp (length text)) (not (find (char text (1- (length text))) ".!?")))
      (setf text (concatenate 'string text ".")))
    (prin1-to-string (if c-line (format nil "~a~@[~%~%~a~]" text c-line) text))))

(defun emit-enum (enum out aliases)
  (let* ((values (jlist enum "values"))
         (prefix (common-prefix (mapcar (lambda (v) (j v "name")) values))))
    (format out "~%(define-enum ~a~%  ~a~{~%  ~a~})~%"
            (lisp-name (j enum "name"))
            (docstring (j enum "description"))
            (append
             (mapcar (lambda (v)
                       (format nil "(:~a ~a)" (enum-keyword (j v "name") prefix) (j v "value")))
                     values)
             ;; Deprecated names raylib keeps as #defines, when they fit the prefix.
             (loop for (alias . target) in aliases
                   for value = (find target values :key (lambda (v) (j v "name")) :test #'string=)
                   when (and value (eql 0 (search prefix alias)))
                     collect (format nil "(:~a ~a)" (enum-keyword alias prefix) (j value "value")))))))

(defun emit-struct (struct out)
  (let ((c-name (j struct "name")))
    (format out "~%(define-struct ~a~%  ~a~{~%  ~a~})~%"
            (struct-lisp-name c-name)
            (docstring (j struct "description"))
            (mapcar (lambda (f)
                      (let ((init (cdr (assoc (cons c-name (j f "name")) *field-initforms* :test #'equal))))
                        (format nil "(~a ~a~@[ :initform ~a~])"
                                (field-lisp-name c-name (j f "name")) (field-kind c-name (j f "type") (j f "name")) init)))
                    (jlist struct "fields")))))

(defun function-kinds (function)
  (let ((name (j function "name")))
    (values (return-kind function)
            (mapcar (lambda (p) (param-kind name (j p "type") (j p "name")))
                    (jlist function "params")))))

(defun needs-shim-p (function)
  (multiple-value-bind (return params) (function-kinds function)
    (or (struct-kind-p return) (some #'struct-kind-p params))))

(defun emit-function (function out)
  (multiple-value-bind (return kinds) (function-kinds function)
    (format out "~%(define-function (~s ~a) ~a~%  ~a~{~%  ~a~})~%"
            (j function "name") (lisp-name (j function "name")) return
            (docstring (j function "description") (concatenate 'string "C: " (c-signature function)))
            (mapcar (lambda (p kind) (format nil "(~a ~a)" (param-name (j p "name")) kind))
                    (jlist function "params") kinds))))

(defun color-defines (api)
  (loop for d in (jlist api "defines")
        when (string= (j d "type") "COLOR")
          collect (cons (string-downcase (j d "name"))
                        (mapcar #'parse-integer
                                (cl-ppcre:all-matches-as-strings "\\d+" (subseq (j d "value") (position #\{ (j d "value"))))))))

(defun alias-defines (api)
  "UNKNOWN defines that rename an enum value or function: (alias . target)."
  (loop for d in (jlist api "defines")
        when (and (string= (j d "type") "UNKNOWN") (stringp (j d "value"))
                  (cl-ppcre:scan "^[A-Za-z_][A-Za-z0-9_]*$" (j d "value")))
          collect (cons (j d "name") (j d "value"))))

(defun exported-names (api)
  "Every symbol the generated file defines for users."
  (let ((names '()))
    (dolist (e (jlist api "enums")) (push (lisp-name (j e "name")) names))
    (dolist (s (jlist api "structs"))
      (let ((n (struct-lisp-name (j s "name"))))
        (push n names)
        (push (format nil "make-~a" n) names)
        (push (format nil "copy-~a" n) names)
        (push (format nil "~a-p" n) names)
        (dolist (f (jlist s "fields"))
          (push (format nil "~a-~a" n (field-lisp-name (j s "name") (j f "name"))) names))))
    (loop for alias being the hash-keys of *aliases* using (hash-value target)
          when (gethash target *structs*)
            do (push (lisp-name alias) names)
               (push (format nil "make-~a" (lisp-name alias)) names))
    (dolist (f (api-functions api))
      (push (lisp-name (j f "name")) names))
    (loop for (alias . target) in (alias-defines api)
          when (find target (jlist api "functions") :key (lambda (f) (j f "name")) :test #'string=)
            do (push (lisp-name alias) names))
    (push "+raylib-version+" names)
    (sort (remove-duplicates names :test #'string=) #'string<)))

(defun check-names (api)
  "Signal an error if two generated definitions would share a name."
  (let ((seen (make-hash-table :test 'equal)))
    (flet ((claim (name what)
             (let ((previous (gethash name seen)))
               (when previous
                 (error "Generated name ~a is both ~a and ~a" name previous what))
               (setf (gethash name seen) what))))
      (dolist (s (jlist api "structs"))
        (let ((n (struct-lisp-name (j s "name"))))
          (claim n "a struct")
          (claim (format nil "make-~a" n) "a constructor")
          (claim (format nil "copy-~a" n) "a copier")
          (claim (format nil "~a-p" n) "a predicate")
          (dolist (f (jlist s "fields"))
            (claim (format nil "~a-~a" n (field-lisp-name (j s "name") (j f "name")))
                   (format nil "an accessor of ~a" (j s "name"))))))
      (dolist (f (api-functions api))
        (claim (lisp-name (j f "name")) (format nil "the function ~a" (j f "name")))))))

(defun write-lisp (api path)
  (let ((aliases (alias-defines api))
        (version (j (find "RAYLIB_VERSION" (jlist api "defines") :key (lambda (d) (j d "name")) :test #'string=)
                    "value")))
    (with-open-file (out path :direction :output :if-exists :supersede)
      (format out ";;;; raylib.lisp — raylib ~a, generated from raylib_api.json by raylib-generator.~%~
                   ;;;; Do not edit: change the generator and run (raylib.generator:generate).~%~%~
                   (in-package #:raylib)~%~%~
                   (eval-when (:compile-toplevel :load-toplevel :execute)~%  ~
                     (export '(~{~a~^~%            ~})))~%~%~
                   (defparameter +raylib-version+ ~s~%  \"The raylib version these bindings were generated for.\")~%"
              version (exported-names api) version)
      (format out "~%;;; Enums~%")
      (dolist (e (jlist api "enums")) (emit-enum e out aliases))
      (format out "~%;;; Colors~%~%(define-colors~{~%  (:~a~{ ~a~})~})~%"
              (loop for (name . rgba) in (color-defines api) append (list name rgba)))
      (format out "~%;;; Structs~%")
      (dolist (s (jlist api "structs")) (emit-struct s out))
      (loop for alias being the hash-keys of *aliases* using (hash-value target)
            when (gethash target *structs*)
              collect (format nil "(define-struct-alias ~a ~a)" (lisp-name alias) (struct-lisp-name target)) into forms
            finally (format out "~%~{~a~%~}" (sort forms #'string<)))
      (format out "~%(define-struct-order~{~%  ~a~})~%"
              (mapcar (lambda (s) (struct-lisp-name (j s "name"))) (jlist api "structs")))
      (format out "~%;;; Functions~%")
      (dolist (f (api-functions api))
        (emit-function f out))
      (format out "~%;;; Deprecated names~%~%")
      (loop for (alias . target) in aliases
            when (find target (jlist api "functions") :key (lambda (f) (j f "name")) :test #'string=)
              do (format out "(define-function-alias ~a ~a)~%" (lisp-name alias) (lisp-name target))))))

;;; Emitting the C shim

(defun write-shim (api path)
  (with-open-file (out path :direction :output :if-exists :supersede)
    (format out "/* shim.c — generated from raylib_api.json by raylib-generator. Do not edit.~
                 ~% *~
                 ~% * raylib passes small structs by value. Each wrapper here takes pointers~
                 ~% * instead, and returns a struct through an extra pointer, so Lisp can call~
                 ~% * these without libffi. */~%~%~
                 #include \"raylib.h\"~%~%~
                 #if defined(_WIN32)~%#define SHIM __declspec(dllexport)~%~
                 #else~%#define SHIM __attribute__((visibility(\"default\")))~%#endif~%~%~
                 /* Sizes of the structs, in raylib_api.json order, to check Lisp's layouts. */~%~
                 SHIM int rlshim_struct_size(int i)~%{~%    switch (i) {~%~
                 ~{~a~}    default: return -1;~%    }~%}~%"
            (loop for s in (jlist api "structs") for i from 0
                  collect (format nil "    case ~d: return (int)sizeof(~a);~%" i (j s "name"))))
    (dolist (f (api-functions api))
      (when (needs-shim-p f)
        (let* ((name (j f "name"))
               (ret (j f "returnType"))
               (struct-return (struct-name ret))
               (params (jlist f "params"))
               (decls (append
                       (mapcar (lambda (p)
                                 (let ((type (j p "type")))
                                   (if (struct-name type)
                                       (format nil "const ~a *~a" type (j p "name"))
                                       (format nil "~a~:[ ~;~]~a" type (char= #\* (char type (1- (length type)))) (j p "name")))))
                               params)
                       (when struct-return (list (format nil "~a *out" ret)))))
               (args (mapcar (lambda (p)
                               (format nil "~:[~;*~]~a" (struct-name (j p "type")) (j p "name")))
                             params))
               (call (format nil "~a(~{~a~^, ~})" name args)))
          (format out "~%SHIM ~a rlshim_~a(~:[void~;~:*~{~a~^, ~}~])~%{~%    ~a;~%}~%"
                  (if struct-return "void" ret) name decls
                  (cond (struct-return (format nil "*out = ~a" call))
                        ((string= ret "void") call)
                        (t (format nil "return ~a" call)))))))))

;;; Entry point

(defun generate (&key (api-path (system-file "spec/raylib_api.json"))
                      (output-directory (system-file "src/generated/")))
  "Regenerate src/generated/raylib.lisp and shim.c from the API description."
  (let ((api (load-api api-path)))
    (index-api api)
    (check-names api)
    (ensure-directories-exist output-directory)
    (write-lisp api (merge-pathnames "raylib.lisp" output-directory))
    (write-shim api (merge-pathnames "shim.c" output-directory))
    (format t "~&Generated ~d functions (~d through the shim), ~d structs, ~d enums.~%"
            (length (api-functions api))
            (count-if #'needs-shim-p (api-functions api))
            (length (jlist api "structs"))
            (length (jlist api "enums")))
    output-directory))
