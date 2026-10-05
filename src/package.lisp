;;;; package.lisp — the RAYLIB package
;;;;
;;;; The generated bindings (src/generated/raylib.lisp) export every raylib
;;;; function, struct, accessor and enum themselves; this lists the rest.

(defpackage #:raylib
  (:use #:cl)
  (:nicknames #:rl)
  (:export
   ;; Libraries
   #:load-libraries #:*library-directories*
   ;; Enums and colors
   #:enum-value #:enum-keyword #:enum-keywords #:color-keywords
   ;; Running on the main thread
   #:run #:stop #:resume #:running-p #:main-thread-p #:*last-error*
   ;; Scopes
   #:with-window #:with-drawing #:with-mode-2d #:with-mode-3d #:with-texture-mode
   #:with-shader-mode #:with-blend-mode #:with-scissor-mode #:with-audio-device
   #:game-loop
   ;; Resources
   #:with-resources #:unload #:valid-p #:resource-load-error
   ;; Values
   #:vec2 #:vec3 #:rect #:color
   #:v2+ #:v2- #:v2* #:v2/ #:v2-dot #:v2-length #:v2-length-squared #:v2-distance
   #:v2-normalize #:v2-lerp #:v2-rotate #:v2-angle #:v2-zero-p
   #:rect-contains-p #:rect-center))
