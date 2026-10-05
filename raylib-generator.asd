;;;; raylib-generator.asd — reads raylib_api.json and writes the bindings (maintainers only)

(defsystem "raylib-generator"
  :description "Reads raylib's API description and emits src/generated/raylib.lisp and shim.c."
  :author "Jessie Hughart"
  :license "MIT"
  :depends-on ("com.inuoe.jzon" "cl-ppcre")
  :pathname "generator/"
  :serial t
  :components ((:file "package")
               (:file "generator")))
