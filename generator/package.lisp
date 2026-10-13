;;;; package.lisp — the raylib binding generator

(defpackage #:raylib.generator
  (:use #:cl)
  (:export #:generate #:generate-docset #:lisp-name #:load-api))
