;;;; docset.lisp — raylib's API and the Lisp layer as a docset, for the spec browser and Cadre
;;;;
;;;; Every function, struct, accessor and enum from raylib_api.json, grouped by
;;;; the module and section raylib.h declares them in, plus the hand-written
;;;; Lisp layer (with-window, game-loop, vec2, ...) read from its source, and
;;;; the README, written with the docset library's WRITE-DOCSET. The format
;;;; is described in docset's docs/format.md.

(in-package #:raylib.generator)

(defun entry (id names kind kind-name sections &key (package "RAYLIB") parent children summary)
  (append (list :entry id :names names :kind kind :kind-name kind-name)
          (when package (list :package package))
          (when parent (list :parent parent))
          (when children (list :children children))
          (when summary (list :summary summary))
          (list :sections (remove nil sections :key #'cdr))))

;;; Ids and links

(defvar *ids* (make-hash-table :test 'equal)
  "Lisp name -> the id of the entry that documents it.")

(defun id-for (kind name) (format nil "~(~a~)/~a" kind name))

(defun note-id (name id)
  (unless (gethash name *ids*) (setf (gethash name *ids*) id)))

(defun code-inline (text)
  "(:ref id text) when TEXT names something documented, as rl:foo or foo, else (:code text)."
  (let* ((bare (string-downcase (subseq text (1+ (or (position #\: text) -1)))))
         (id (and (or (not (find #\: text)) (member (subseq text 0 (position #\: text)) '("rl" "raylib") :test #'string-equal))
                  (gethash bare *ids*))))
    (if id (list :ref id text) (list :code text))))

(defun sentence (text)
  "TEXT trimmed, ending with a full stop."
  (let ((text (string-trim " " (or text ""))))
    (if (and (plusp (length text)) (not (find (char text (1- (length text))) ".!?")))
        (concatenate 'string text ".")
        text)))

(defun first-sentence (text)
  (let* ((text (substitute #\Space #\Newline (string-trim '(#\Space #\Newline) (or text ""))))
         (end (search ". " text)))
    (when (plusp (length text))
      (if end (subseq text 0 (1+ end)) text))))

;;; Markdown, for the README

(defun markdown-inlines (text)
  "TEXT's `code`, **bold**, [links](url) and plain text as docset inlines."
  (let ((out '()) (plain (make-string-output-stream)) (i 0) (n (length text)))
    (flet ((flush ()
             (let ((s (get-output-stream-string plain)))
               (when (plusp (length s)) (push s out)))))
      (loop
        (when (>= i n) (return))
        (let ((c (char text i)))
          (cond
            ((and (char= c #\`) (position #\` text :start (1+ i)))
             (let ((end (position #\` text :start (1+ i))))
               (flush)
               (push (code-inline (subseq text (1+ i) end)) out)
               (setf i (1+ end))))
            ((and (char= c #\*) (< (1+ i) n) (char= (char text (1+ i)) #\*) (search "**" text :start2 (+ i 2)))
             (let ((end (search "**" text :start2 (+ i 2))))
               (flush)
               (push (cons :b (markdown-inlines (subseq text (+ i 2) end))) out)
               (setf i (+ end 2))))
            ((and (char= c #\[) (search "](" text :start2 i)
                  (let ((mid (search "](" text :start2 i)))
                    (and (not (find #\] text :start (1+ i) :end mid)) (position #\) text :start mid))))
             (let* ((mid (search "](" text :start2 i))
                    (end (position #\) text :start mid)))
               (flush)
               (push (list* :link (subseq text (+ mid 2) end) (markdown-inlines (subseq text (1+ i) mid))) out)
               (setf i (1+ end))))
            (t (write-char c plain) (incf i)))))
      (flush))
    (nreverse out)))

(defun markdown-blocks (text)
  "TEXT's paragraphs, fenced code, bullet lists, tables and headings as docset blocks."
  (let ((blocks '()) (para '()) (code nil) (code-language nil) (items nil) (table nil))
    (labels ((flush-para ()
               (when para
                 (push (cons :p (markdown-inlines (format nil "~{~a~^ ~}" (reverse para)))) blocks)
                 (setf para '())))
             (close-list ()
               (when items
                 (push (cons :list (mapcar (lambda (text) (list :item (cons :p (markdown-inlines text))))
                                           (reverse items)))
                       blocks)
                 (setf items nil)))
             (close-table ()
               (when table
                 (let ((rows (reverse table)))
                   (push (list :table :header (first rows) :rows (rest rows)) blocks))
                 (setf table nil)))
             (cells (line)
               (mapcar (lambda (c) (markdown-inlines (string-trim " " c)))
                       (butlast (rest (cl-ppcre:split "\\|" line :limit most-positive-fixnum))))))
      (dolist (raw (cl-ppcre:split "\\n" text))
        (let* ((line (string-right-trim '(#\Space #\Return) raw))
               (trimmed (string-left-trim " " line)))
          (cond
            ((and (>= (length trimmed) 3) (string= "```" (subseq trimmed 0 3)))
             (flush-para) (close-list) (close-table)
             (if code
                 (progn (push (list :code-block code-language (format nil "~{~a~^~%~}" (reverse (rest code)))) blocks)
                        (setf code nil))
                 (setf code (list :open)
                       code-language (let ((lang (string-trim " " (subseq trimmed 3))))
                                       (and (plusp (length lang)) (string-downcase lang))))))
            (code (push line code))
            ((and (> (length line) 1) (char= (char line 0) #\|))
             (flush-para) (close-list)
             (let ((row (cells line)))
               (unless (every (lambda (c) (every (lambda (x) (and (stringp x) (every (lambda (ch) (find ch "-: ")) x))) c)) row)
                 (push row table))))
            ((progn (close-table) nil))
            ((string= trimmed "") (flush-para) (close-list))
            ((char= (char line 0) #\#)
             (flush-para) (close-list)
             (push (list* :heading (min 4 (or (position #\# line :test-not #'char=) 1))
                          (markdown-inlines (string-trim "# " line)))
                   blocks))
            ((and (> (length trimmed) 2) (member (char trimmed 0) '(#\- #\*)) (char= (char trimmed 1) #\Space))
             (flush-para)
             (push (subseq trimmed 2) items))
            ((and items (char= (char raw 0) #\Space))
             (setf (first items) (format nil "~a ~a" (first items) trimmed)))
            (t (close-list) (push trimmed para)))))
      (flush-para) (close-list) (close-table))
    (nreverse blocks)))

;;; Where raylib.h declares each function: its module and section

(defun header-sections (&optional (path (system-file "spec/raylib.h")))
  "C function name -> (module . section), from the comments raylib.h groups its
declarations under, such as \"Texture Loading and Drawing Functions (Module:
textures)\" and \"Image generation functions\". Empty when there is no header."
  (let ((table (make-hash-table :test 'equal)))
    (when (probe-file path)
      (let ((module nil) (section nil) (previous :blank))
        (with-open-file (in path)
          (loop for line = (read-line in nil)
                while line
                do (let ((trimmed (string-trim " " line)))
                     (cl-ppcre:register-groups-bind (title name) ("^//\\s*(.+?)\\s*\\(Module: (\\w+)\\)" trimmed)
                       (setf module (format nil "~a: ~a" name title) section nil))
                     (cond ((and module (eql 0 (search "RLAPI" trimmed)))
                            (cl-ppcre:register-groups-bind (fn) ("\\b(\\w+)\\s*\\(" trimmed)
                              (setf (gethash fn table) (cons module (or section "Functions"))))
                            (setf previous :rlapi))
                           ((eql 0 (search "//" trimmed))
                            ;; The first comment line of a block names the section; later
                            ;; lines are notes. Ruled lines and module titles are not sections.
                            (unless (or (eq previous :comment) (search "----" trimmed) (search "(Module:" trimmed))
                              (setf section (string-trim "/ " trimmed)))
                            (setf previous :comment))
                           (t (setf previous :blank))))))))
    table))

;;; The C API

(defun lisp-ref (name) (format nil "rl:~a" name))

(defun type-cell (function-name c-type c-name)
  "Inlines describing a parameter, field or return type: a link to the enum or
struct it takes, or the C type."
  (let ((enum (and function-name c-name (member c-type '("int" "unsigned int") :test #'string=)
                   (param-enum function-name c-name)))
        (struct (or (struct-name c-type) (let ((base (pointee c-type))) (and base (struct-name base))))))
    (cond (enum (list "a keyword of " (code-inline (lisp-name enum))))
          (struct (list (code-inline (struct-lisp-name struct))
                        (if (find #\* c-type) (format nil " (~a)" c-type) "")))
          (t (list (list :code c-type))))))

(defun function-entry (function deprecated-names)
  (let* ((c-name (j function "name"))
         (name (lisp-name c-name))
         (params (jlist function "params"))
         (return-type (j function "returnType")))
    (entry (id-for :function name)
           (append (list name c-name) (cdr (assoc c-name deprecated-names :test #'string=)))
           :function "Function"
           (list (list* "Syntax"
                        (list :syntax :kind :function :name (list (lisp-ref name))
                                      :args (and params (list (format nil "~{~a~^ ~}"
                                                                      (mapcar (lambda (p) (param-name (j p "name"))) params)))))
                        (unless (string= return-type "void")
                          (list (list* :p "Returns " (append (type-cell c-name return-type nil) (list "."))))))
                 (list "Description" (list :p (sentence (j function "description"))))
                 (when params
                   (list "Parameters"
                         (list :table :header '(("Parameter") ("Type") ("C"))
                                      :rows (loop for p in params
                                                  collect (list (list (list :param (param-name (j p "name"))))
                                                                (type-cell c-name (j p "type") (j p "name"))
                                                                (list (list :code (format nil "~a ~a" (j p "type") (j p "name")))))))))
                 (list "C" (list :code-block "c" (c-signature function))))
           :summary (first-sentence (sentence (j function "description"))))))

(defun struct-entries (struct aliases)
  "The entry for STRUCT, then one per field accessor."
  (let* ((c-name (j struct "name"))
         (name (struct-lisp-name c-name))
         (id (id-for :struct name))
         (fields (jlist struct "fields"))
         (accessors (mapcar (lambda (f) (format nil "~a-~a" name (field-lisp-name c-name (j f "name")))) fields)))
    (cons
     (entry id
            (append (list name c-name (format nil "make-~a" name) (format nil "copy-~a" name) (format nil "~a-p" name))
                    (loop for (alias . target) in aliases
                          when (string= target c-name)
                            append (list (lisp-name alias) alias (format nil "make-~a" (lisp-name alias)))))
            :struct "Struct"
            (list (list "Description" (list :p (sentence (j struct "description"))))
                  (list "Construct"
                        (list :code-block "lisp"
                              (format nil "(rl:make-~a~{ :~a ~:*~a~})" name
                                      (mapcar (lambda (f) (field-lisp-name c-name (j f "name"))) fields))))
                  (list "Fields"
                        (list :table :header '(("Accessor") ("Type") ("Description"))
                                     :rows (loop for f in fields
                                                 for accessor in accessors
                                                 collect (list (list (code-inline accessor))
                                                               (type-cell nil (j f "type") nil)
                                                               (list (sentence (j f "description"))))))))
            :children (mapcar (lambda (a) (id-for :accessor a)) accessors)
            :summary (first-sentence (sentence (j struct "description"))))
     (loop for f in fields
           for accessor in accessors
           collect (entry (id-for :accessor accessor) (list accessor) :accessor "Accessor"
                          (list (list "Syntax" (list :syntax :kind :accessor :name (list (lisp-ref accessor))
                                                             :args (list name)))
                                (list "Description" (list :p (sentence (j f "description")))
                                      (list* :p "The " (list :code (j f "name")) " field of "
                                             (code-inline name) ", " (append (type-cell nil (j f "type") nil)
                                                                             (list ". Writable with setf.")))))
                          :parent id
                          :summary (first-sentence (sentence (j f "description"))))))))

(defun enum-entry (enum)
  (let* ((values (jlist enum "values"))
         (prefix (common-prefix (mapcar (lambda (v) (j v "name")) values)))
         (name (lisp-name (j enum "name"))))
    (entry (id-for :enum name) (list name (j enum "name")) :enum "Enumeration"
           (list (list "Description" (list :p (sentence (j enum "description")))
                       (list :p "Pass a keyword, or a list of keywords where flags combine."))
                 (list "Values"
                       (list :table :header '(("Keyword") ("Value") ("C") ("Description"))
                                    :rows (loop for v in values
                                                collect (list (list (list :code (format nil ":~a" (enum-keyword (j v "name") prefix))))
                                                              (list (princ-to-string (j v "value")))
                                                              (list (list :code (j v "name")))
                                                              (list (sentence (j v "description"))))))))
           :summary (first-sentence (sentence (j enum "description"))))))

(defun colors-entry (api)
  (entry "page/colors" (list "colors") :page "Colors"
         (list (list "Colors"
                     (list :p "raylib's named colors. Pass the keyword wherever a color is expected, as in "
                           (list :code "(rl:clear-background :raywhite)") ".")
                     (list :table :header '(("Keyword") ("Red") ("Green") ("Blue") ("Alpha"))
                                  :rows (loop for (name . rgba) in (color-defines api)
                                              collect (cons (list (list :code (format nil ":~a" name)))
                                                            (mapcar (lambda (n) (list (princ-to-string n))) rgba))))))
         :package nil
         :summary "raylib's named colors, as keywords."))

;;; The Lisp layer, read from its source

(defun lisp-layer-files ()
  ;; Not SYSTEM-FILE: it reads the * literally.
  (let ((root (asdf:system-source-directory "raylib-generator")))
    (append (directory (merge-pathnames "src/lisp/*.lisp" root))
            (directory (merge-pathnames "src/runtime/*.lisp" root)))))

(defun file-title (path)
  "The description on a source file's first line, \";;;; scopes.lisp — the window...\"."
  (with-open-file (in path)
    (let* ((line (read-line in nil ""))
           (dash (search "— " line)))
      (if dash
          (let ((title (string-trim " " (subseq line (+ dash 2)))))
            (string-capitalize title :end (min 1 (length title))))
          (pathname-name path)))))

(defun docstring-blocks (doc)
  (loop for para in (cl-ppcre:split "\\n\\s*\\n" (string-trim '(#\Space #\Newline) doc))
        collect (list :p (substitute #\Space #\Newline
                                     (cl-ppcre:regex-replace-all "\\n\\s+" para (string #\Newline))))))

(defun definition-documentation (form)
  "FORM's kind, lambda list (or NIL) and docstring, for the definitions the Lisp layer uses."
  (destructuring-bind (operator name &rest rest) form
    (declare (ignore name))
    (flet ((option-doc (options)
             (second (find :documentation options :key (lambda (o) (and (consp o) (car o)))))))
      (case operator
        ((defun defmacro)
         (values (if (eq operator 'defun) :function :macro) (first rest)
                 (let ((doc (second rest))) (and (stringp doc) (cddr rest) doc))))
        (defgeneric (values :generic-function (first rest) (option-doc (rest rest))))
        ((defvar defparameter) (values :variable nil (and (stringp (second rest)) (second rest))))
        (define-condition (values :condition nil (option-doc (cddr rest))))))))

(defun lisp-layer-entries ()
  "(title . entries) for each Lisp layer source file that defines exported symbols."
  (unless (find-package "RAYLIB")
    (load (system-file "src/package.lisp")))
  (let ((package (find-package "RAYLIB"))
        (seen (make-hash-table :test 'eq)))
    (loop for path in (lisp-layer-files)
          for entries = (with-open-file (in path)
                          (let ((*package* package) (*read-eval* nil))
                            (loop for form = (read in nil in)
                                  until (eq form in)
                                  when (and (consp form) (symbolp (second form))
                                            (eq (nth-value 1 (find-symbol (symbol-name (second form)) package)) :external)
                                            (not (gethash (second form) seen)))
                                    append (multiple-value-bind (kind lambda-list doc) (definition-documentation form)
                                             (when kind
                                               (setf (gethash (second form) seen) t)
                                               (let ((name (string-downcase (symbol-name (second form)))))
                                                 (list (entry (id-for kind name) (list name) kind
                                                              (string-capitalize (substitute #\Space #\- (string kind)))
                                                              (list (when (member kind '(:function :macro :generic-function))
                                                                      (list "Syntax"
                                                                            (list :syntax :kind kind :name (list (lisp-ref name))
                                                                                          :args (and lambda-list
                                                                                                     (list (let ((*package* package) (*print-case* :downcase))
                                                                                                             (format nil "~{~s~^ ~}" lambda-list)))))))
                                                                    (cons "Description" (and doc (docstring-blocks doc))))
                                                              :summary (and doc (first-sentence doc))))))))))
          when entries collect (cons (file-title path) entries))))

;;; The docset

(defun generate-docset (&key (api-path (system-file "spec/raylib_api.json"))
                             (directory (system-file "docs/docset/")))
  "Write raylib's docset into DIRECTORY."
  (let* ((api (load-api api-path))
         (sections (header-sections))
         ;; Old names raylib keeps as #defines: (target-c-name lisp-alias ...)
         (deprecated (let ((names '()))
                       (loop for (alias . target) in (alias-defines api)
                             when (find target (jlist api "functions") :key (lambda (f) (j f "name")) :test #'string=)
                               do (let ((cell (assoc target names :test #'string=)))
                                    (if cell
                                        (push (lisp-name alias) (cdr cell))
                                        (push (list target (lisp-name alias)) names))))
                       names))
         (struct-aliases (progn (index-api api)
                                (loop for alias being the hash-keys of *aliases* using (hash-value target)
                                      when (gethash target *structs*) collect (cons alias target)))))
    (clrhash *ids*)
    ;; Ids first, so text can link to anything
    (dolist (f (api-functions api)) (note-id (lisp-name (j f "name")) (id-for :function (lisp-name (j f "name")))))
    (dolist (s (jlist api "structs"))
      (let ((name (struct-lisp-name (j s "name"))))
        (note-id name (id-for :struct name))
        (note-id (format nil "make-~a" name) (id-for :struct name))
        (dolist (f (jlist s "fields"))
          (let ((accessor (format nil "~a-~a" name (field-lisp-name (j s "name") (j f "name")))))
            (note-id accessor (id-for :accessor accessor))))))
    (loop for (alias . target) in struct-aliases
          do (note-id (lisp-name alias) (id-for :struct (struct-lisp-name target))))
    (dolist (e (jlist api "enums")) (note-id (lisp-name (j e "name")) (id-for :enum (lisp-name (j e "name")))))
    (let* ((lisp-layer (lisp-layer-entries))
           (_ (loop for (nil . entries) in lisp-layer
                    do (dolist (e entries) (note-id (first (getf (cddr e) :names)) (second e)))))
           (readme (let ((path (system-file "README.md")))
                     (when (probe-file path)
                       (let ((blocks (markdown-blocks (uiop:read-file-string path))))
                         (entry "page/readme" (list "raylib for Common Lisp") :page "Guide"
                                (list (cons "" (if (eq (car (first blocks)) :heading) (rest blocks) blocks)))
                                :package nil
                                :summary "Using the bindings: names, values, the game loop and the REPL.")))))
           (functions (loop for f in (api-functions api)
                            collect (function-entry f deprecated)))
           (structs (loop for s in (jlist api "structs") append (struct-entries s struct-aliases)))
           (enums (mapcar #'enum-entry (jlist api "enums")))
           (colors (colors-entry api))
           (entries (append (when readme (list readme))
                            (loop for (nil . e) in lisp-layer append e)
                            functions structs enums (list colors)))
           (modules '()))
      (declare (ignore _))
      ;; Group functions by module, then section, in header order
      (dolist (f (api-functions api))
        (destructuring-bind (module . section) (gethash (j f "name") sections (cons "Other functions" "Functions"))
          (let* ((m (or (assoc module modules :test #'string=) (car (push (list module) modules))))
                 (s (or (assoc section (cdr m) :test #'string=)
                        (car (setf (cdr m) (append (cdr m) (list (list section))))))))
            (setf (cdr s) (append (cdr s) (list (lisp-name (j f "name"))))))))
      (docset:write-docset directory
                    (list :id "raylib"
                          :title "raylib"
                          :subtitle "raylib 6.0 bindings for Common Lisp"
                          :version (asdf:component-version (asdf:find-system "raylib"))
                          :system "raylib"
                          :packages '("RAYLIB")
                          :source "https://www.raylib.com/"
                          :attribution "API descriptions from raylib's raylib_api.json and raylib.h (raylib 6.0, zlib license, Ramon Santamaria and contributors)."
                          :license "raylib is under the zlib/libpng license."
                          :toc (append
                                (when readme (list (list :title "Guide" :entry "page/readme")))
                                (list (list :title "Lisp layer"
                                            :children (loop for (title . es) in lisp-layer
                                                            collect (list :title title
                                                                          :children (loop for e in es
                                                                                          collect (list :title (first (getf (cddr e) :names))
                                                                                                        :entry (second e)))))))
                                (loop for (module . secs) in (reverse modules)
                                      collect (list :title module
                                                    :children (loop for (section . names) in secs
                                                                    collect (list :title section
                                                                                  :children (loop for n in names
                                                                                                  collect (list :title n :entry (id-for :function n)))))))
                                (list (list :title "Structs"
                                            :children (loop for s in (jlist api "structs")
                                                            for n = (struct-lisp-name (j s "name"))
                                                            collect (list :title n :entry (id-for :struct n))))
                                      (list :title "Enumerations"
                                            :children (loop for e in (jlist api "enums")
                                                            for n = (lisp-name (j e "name"))
                                                            collect (list :title n :entry (id-for :enum n))))
                                      (list :title "Colors" :entry "page/colors"))))
                    entries)
      (format t "~&Docset: ~d entries in ~a~%" (length entries) directory)
      directory)))
