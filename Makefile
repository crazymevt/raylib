SBCL ?= sbcl
LISP = $(SBCL) --non-interactive --eval '(push (truename ".") asdf:*central-registry*)'

.PHONY: generate docset test walker

generate:
	$(LISP) --eval '(ql:quickload :raylib-generator :silent t)' \
	        --eval '(raylib.generator:generate)'

# The API and the Lisp layer as a docset for the spec browser, in docs/docset/
docset:
	$(LISP) --eval '(ql:quickload :raylib-generator :silent t)' \
	        --eval '(raylib.generator:generate-docset)'

test:
	$(LISP) --eval '(ql:quickload :raylib/tests :silent t)' \
	        --eval '(uiop:quit (if (eq :passed (parachute:status (parachute:test :raylib-tests))) 0 1))'

walker:
	$(LISP) --eval '(ql:quickload :raylib/examples :silent t)' \
	        --eval '(raylib-examples:walker)'
