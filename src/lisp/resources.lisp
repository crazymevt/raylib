;;;; resources.lisp — loading and unloading textures, sounds, fonts, ...

(in-package #:raylib)

(defgeneric unload (resource)
  (:documentation "Free RESOURCE: a texture, image, font, sound, music, shader, ...")
  (:method ((resource null)) nil))

(defgeneric valid-p (resource)
  (:documentation "True if RESOURCE loaded successfully. raylib doesn't signal
errors when loading fails: it logs a warning and returns an empty resource.")
  (:method (resource) (declare (ignore resource)) t))

(macrolet ((define-resource (type unloader validator)
             `(progn
                (defmethod unload ((resource ,type)) (,unloader resource))
                (defmethod valid-p ((resource ,type)) (,validator resource)))))
  (define-resource image unload-image is-image-valid)
  (define-resource texture unload-texture is-texture-valid)
  (define-resource render-texture unload-render-texture is-render-texture-valid)
  (define-resource font unload-font is-font-valid)
  (define-resource shader unload-shader is-shader-valid)
  (define-resource model unload-model is-model-valid)
  (define-resource material unload-material is-material-valid)
  (define-resource wave unload-wave is-wave-valid)
  (define-resource sound unload-sound is-sound-valid)
  (define-resource music unload-music-stream is-music-valid)
  (define-resource audio-stream unload-audio-stream is-audio-stream-valid))

(defmethod unload ((resource mesh)) (unload-mesh resource))

(define-condition resource-load-error (error)
  ((form :initarg :form :reader resource-load-error-form))
  (:report (lambda (c s)
             (format s "Couldn't load ~s.~%Relative paths are resolved from ~a; ~
                        an absolute path or (asdf:system-relative-pathname ...) avoids surprises."
                     (resource-load-error-form c) (get-working-directory)))))

(defmacro with-resources (bindings &body body)
  "Bind each (variable form) in BINDINGS to a loaded resource, run BODY, and
unload them all afterwards, last first. Signals RESOURCE-LOAD-ERROR if one
fails to load, rather than drawing nothing.

  (rl:with-resources ((hero (rl:load-texture \"hero.png\"))
                      (hit (rl:load-sound \"hit.wav\")))
    ...)"
  (if (null bindings)
      `(progn ,@body)
      (destructuring-bind ((var form) &rest more) bindings
        `(let ((,var ,form))
           (unwind-protect
                (progn
                  (unless (valid-p ,var)
                    (error 'resource-load-error :form ',form))
                  (with-resources ,more ,@body))
             (unload ,var))))))
