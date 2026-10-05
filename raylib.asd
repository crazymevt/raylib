;;;; raylib.asd — raylib 6.0 bindings for Common Lisp

(defsystem "raylib"
  :description "Bindings for raylib 6.0, generated from its API description, with a Lispy layer for games."
  :author "Jessie Hughart"
  :license "MIT"
  :version "0.1.0"
  :depends-on ("cffi" "alexandria")
  :in-order-to ((test-op (test-op "raylib/tests")))
  :serial t
  :components ((:file "src/package")
               (:module "runtime"
                :pathname "src/runtime/"
                :serial t
                :components ((:file "library")
                             (:file "types")
                             (:file "structs")
                             (:file "functions")
                             (:file "threads")))
               (:static-file "src/generated/shim.c")
               (:file "src/generated/raylib")
               (:module "lisp"
                :pathname "src/lisp/"
                :serial t
                :components ((:file "values")
                             (:file "scopes")
                             (:file "resources")))))

(defsystem "raylib/examples"
  :description "Small programs showing the bindings at work."
  :depends-on ("raylib")
  :pathname "examples/"
  :components ((:file "walker")))

(defsystem "raylib/tests"
  :description "Tests that need no window, and one that opens one."
  :depends-on ("raylib" "raylib-generator" "parachute")
  :pathname "tests/"
  :components ((:file "tests"))
  :perform (test-op (op c) (uiop:symbol-call :parachute :test :raylib-tests)))
