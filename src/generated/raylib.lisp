;;;; raylib.lisp — raylib 6.0, generated from raylib_api.json by raylib-generator.
;;;; Do not edit: change the generator and run (raylib.generator:generate).

(in-package #:raylib)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export '(+raylib-version+
            attach-audio-mixed-processor
            attach-audio-stream-processor
            audio-stream
            audio-stream-buffer
            audio-stream-channels
            audio-stream-p
            audio-stream-processor
            audio-stream-sample-rate
            audio-stream-sample-size
            automation-event
            automation-event-frame
            automation-event-list
            automation-event-list-capacity
            automation-event-list-count
            automation-event-list-events
            automation-event-list-p
            automation-event-p
            automation-event-params
            automation-event-type
            begin-blend-mode
            begin-drawing
            begin-mode-2d
            begin-mode-3d
            begin-scissor-mode
            begin-shader-mode
            begin-texture-mode
            begin-vr-stereo-mode
            blend-mode
            bone-info
            bone-info-name
            bone-info-p
            bone-info-parent
            bounding-box
            bounding-box-max
            bounding-box-min
            bounding-box-p
            camera
            camera-2d
            camera-2d-offset
            camera-2d-p
            camera-2d-rotation
            camera-2d-target
            camera-2d-zoom
            camera-3d
            camera-3d-fovy
            camera-3d-p
            camera-3d-position
            camera-3d-projection
            camera-3d-target
            camera-3d-up
            camera-mode
            camera-projection
            change-directory
            check-collision-box-sphere
            check-collision-boxes
            check-collision-circle-line
            check-collision-circle-rec
            check-collision-circles
            check-collision-lines
            check-collision-point-circle
            check-collision-point-line
            check-collision-point-poly
            check-collision-point-rec
            check-collision-point-triangle
            check-collision-recs
            check-collision-spheres
            clear-background
            clear-window-state
            close-audio-device
            close-window
            codepoint-to-utf8
            color
            color-a
            color-alpha
            color-alpha-blend
            color-b
            color-brightness
            color-contrast
            color-from-hsv
            color-from-normalized
            color-g
            color-is-equal
            color-lerp
            color-normalize
            color-p
            color-r
            color-tint
            color-to-hsv
            color-to-int
            compress-data
            compute-crc32
            compute-md5
            compute-sha1
            compute-sha256
            config-flags
            copy-audio-stream
            copy-automation-event
            copy-automation-event-list
            copy-bone-info
            copy-bounding-box
            copy-camera-2d
            copy-camera-3d
            copy-color
            copy-file-path-list
            copy-font
            copy-glyph-info
            copy-image
            copy-material
            copy-material-map
            copy-matrix
            copy-mesh
            copy-model
            copy-model-animation
            copy-music
            copy-n-patch-info
            copy-ray
            copy-ray-collision
            copy-rectangle
            copy-render-texture
            copy-shader
            copy-skeleton
            copy-sound
            copy-texture
            copy-transform
            copy-vector2
            copy-vector3
            copy-vector4
            copy-vr-device-info
            copy-vr-stereo-config
            copy-wave
            cubemap-layout
            decode-data-base64
            decompress-data
            detach-audio-mixed-processor
            detach-audio-stream-processor
            directory-exists
            disable-cursor
            disable-event-waiting
            draw-billboard
            draw-billboard-pro
            draw-billboard-rec
            draw-bounding-box
            draw-capsule
            draw-capsule-wires
            draw-circle
            draw-circle-3d
            draw-circle-gradient
            draw-circle-lines
            draw-circle-lines-v
            draw-circle-sector
            draw-circle-sector-lines
            draw-circle-v
            draw-cube
            draw-cube-v
            draw-cube-wires
            draw-cube-wires-v
            draw-cylinder
            draw-cylinder-ex
            draw-cylinder-wires
            draw-cylinder-wires-ex
            draw-ellipse
            draw-ellipse-lines
            draw-ellipse-lines-v
            draw-ellipse-v
            draw-fps
            draw-grid
            draw-line
            draw-line-3d
            draw-line-bezier
            draw-line-dashed
            draw-line-ex
            draw-line-strip
            draw-line-v
            draw-mesh
            draw-mesh-instanced
            draw-model
            draw-model-ex
            draw-model-wires
            draw-model-wires-ex
            draw-pixel
            draw-pixel-v
            draw-plane
            draw-point-3d
            draw-poly
            draw-poly-lines
            draw-poly-lines-ex
            draw-ray
            draw-rectangle
            draw-rectangle-gradient-ex
            draw-rectangle-gradient-h
            draw-rectangle-gradient-v
            draw-rectangle-lines
            draw-rectangle-lines-ex
            draw-rectangle-pro
            draw-rectangle-rec
            draw-rectangle-rounded
            draw-rectangle-rounded-lines
            draw-rectangle-rounded-lines-ex
            draw-rectangle-v
            draw-ring
            draw-ring-lines
            draw-sphere
            draw-sphere-ex
            draw-sphere-wires
            draw-spline-basis
            draw-spline-bezier-cubic
            draw-spline-bezier-quadratic
            draw-spline-catmull-rom
            draw-spline-linear
            draw-spline-segment-basis
            draw-spline-segment-bezier-cubic
            draw-spline-segment-bezier-quadratic
            draw-spline-segment-catmull-rom
            draw-spline-segment-linear
            draw-text
            draw-text-codepoint
            draw-text-codepoints
            draw-text-ex
            draw-text-pro
            draw-texture
            draw-texture-ex
            draw-texture-n-patch
            draw-texture-pro
            draw-texture-rec
            draw-texture-v
            draw-triangle
            draw-triangle-3d
            draw-triangle-fan
            draw-triangle-lines
            draw-triangle-strip
            draw-triangle-strip-3d
            enable-cursor
            enable-event-waiting
            encode-data-base64
            end-blend-mode
            end-drawing
            end-mode-2d
            end-mode-3d
            end-scissor-mode
            end-shader-mode
            end-texture-mode
            end-vr-stereo-mode
            export-automation-event-list
            export-data-as-code
            export-font-as-code
            export-image
            export-image-as-code
            export-image-to-memory
            export-mesh
            export-mesh-as-code
            export-wave
            export-wave-as-code
            fade
            file-copy
            file-exists
            file-move
            file-path-list
            file-path-list-count
            file-path-list-p
            file-path-list-paths
            file-remove
            file-rename
            file-text-find-index
            file-text-replace
            font
            font-base-size
            font-glyph-count
            font-glyph-padding
            font-glyphs
            font-p
            font-recs
            font-texture
            font-type
            gamepad-axis
            gamepad-button
            gen-image-cellular
            gen-image-checked
            gen-image-color
            gen-image-font-atlas
            gen-image-gradient-linear
            gen-image-gradient-radial
            gen-image-gradient-square
            gen-image-perlin-noise
            gen-image-text
            gen-image-white-noise
            gen-mesh-cone
            gen-mesh-cube
            gen-mesh-cubicmap
            gen-mesh-cylinder
            gen-mesh-heightmap
            gen-mesh-hemi-sphere
            gen-mesh-knot
            gen-mesh-plane
            gen-mesh-poly
            gen-mesh-sphere
            gen-mesh-tangents
            gen-mesh-torus
            gen-texture-mipmaps
            gesture
            get-application-directory
            get-camera-matrix
            get-camera-matrix-2d
            get-char-pressed
            get-clipboard-image
            get-clipboard-text
            get-codepoint
            get-codepoint-count
            get-codepoint-next
            get-codepoint-previous
            get-collision-rec
            get-color
            get-current-monitor
            get-directory-file-count
            get-directory-file-count-ex
            get-directory-path
            get-file-extension
            get-file-length
            get-file-mod-time
            get-file-name
            get-file-name-without-ext
            get-font-default
            get-fps
            get-frame-time
            get-gamepad-axis-count
            get-gamepad-axis-movement
            get-gamepad-button-pressed
            get-gamepad-name
            get-gesture-detected
            get-gesture-drag-angle
            get-gesture-drag-vector
            get-gesture-hold-duration
            get-gesture-pinch-angle
            get-gesture-pinch-vector
            get-glyph-atlas-rec
            get-glyph-index
            get-glyph-info
            get-image-alpha-border
            get-image-color
            get-key-name
            get-key-pressed
            get-master-volume
            get-mesh-bounding-box
            get-model-bounding-box
            get-monitor-count
            get-monitor-height
            get-monitor-name
            get-monitor-physical-height
            get-monitor-physical-width
            get-monitor-position
            get-monitor-refresh-rate
            get-monitor-width
            get-mouse-delta
            get-mouse-position
            get-mouse-ray
            get-mouse-wheel-move
            get-mouse-wheel-move-v
            get-mouse-x
            get-mouse-y
            get-music-time-length
            get-music-time-played
            get-pixel-color
            get-pixel-data-size
            get-prev-directory-path
            get-random-value
            get-ray-collision-box
            get-ray-collision-mesh
            get-ray-collision-quad
            get-ray-collision-sphere
            get-ray-collision-triangle
            get-render-height
            get-render-width
            get-screen-height
            get-screen-to-world-2d
            get-screen-to-world-ray
            get-screen-to-world-ray-ex
            get-screen-width
            get-shader-location
            get-shader-location-attrib
            get-shapes-texture
            get-shapes-texture-rectangle
            get-spline-point-basis
            get-spline-point-bezier-cubic
            get-spline-point-bezier-quad
            get-spline-point-catmull-rom
            get-spline-point-linear
            get-text-between
            get-time
            get-touch-point-count
            get-touch-point-id
            get-touch-position
            get-touch-x
            get-touch-y
            get-window-handle
            get-window-position
            get-window-scale-dpi
            get-working-directory
            get-world-to-screen
            get-world-to-screen-2d
            get-world-to-screen-ex
            glyph-info
            glyph-info-advance-x
            glyph-info-image
            glyph-info-offset-x
            glyph-info-offset-y
            glyph-info-p
            glyph-info-value
            hide-cursor
            image
            image-alpha-clear
            image-alpha-crop
            image-alpha-mask
            image-alpha-premultiply
            image-blur-gaussian
            image-clear-background
            image-color-brightness
            image-color-contrast
            image-color-grayscale
            image-color-invert
            image-color-replace
            image-color-tint
            image-copy
            image-crop
            image-data
            image-dither
            image-draw
            image-draw-circle
            image-draw-circle-lines
            image-draw-circle-lines-v
            image-draw-circle-v
            image-draw-line
            image-draw-line-ex
            image-draw-line-v
            image-draw-pixel
            image-draw-pixel-v
            image-draw-rectangle
            image-draw-rectangle-lines
            image-draw-rectangle-rec
            image-draw-rectangle-v
            image-draw-text
            image-draw-text-ex
            image-draw-triangle
            image-draw-triangle-ex
            image-draw-triangle-fan
            image-draw-triangle-lines
            image-draw-triangle-strip
            image-flip-horizontal
            image-flip-vertical
            image-format
            image-from-channel
            image-from-image
            image-height
            image-kernel-convolution
            image-mipmap-count
            image-mipmaps
            image-p
            image-pixel-format
            image-resize
            image-resize-canvas
            image-resize-nn
            image-rotate
            image-rotate-ccw
            image-rotate-cw
            image-text
            image-text-ex
            image-to-pot
            image-width
            init-audio-device
            init-window
            is-audio-device-ready
            is-audio-stream-playing
            is-audio-stream-processed
            is-audio-stream-valid
            is-cursor-hidden
            is-cursor-on-screen
            is-file-dropped
            is-file-extension
            is-file-name-valid
            is-font-valid
            is-gamepad-available
            is-gamepad-button-down
            is-gamepad-button-pressed
            is-gamepad-button-released
            is-gamepad-button-up
            is-gesture-detected
            is-image-valid
            is-key-down
            is-key-pressed
            is-key-pressed-repeat
            is-key-released
            is-key-up
            is-material-valid
            is-model-animation-valid
            is-model-valid
            is-mouse-button-down
            is-mouse-button-pressed
            is-mouse-button-released
            is-mouse-button-up
            is-music-stream-playing
            is-music-valid
            is-path-file
            is-render-texture-valid
            is-shader-valid
            is-sound-playing
            is-sound-valid
            is-texture-valid
            is-wave-valid
            is-window-focused
            is-window-fullscreen
            is-window-hidden
            is-window-maximized
            is-window-minimized
            is-window-ready
            is-window-resized
            is-window-state
            keyboard-key
            load-audio-stream
            load-automation-event-list
            load-codepoints
            load-directory-files
            load-directory-files-ex
            load-dropped-files
            load-file-data
            load-file-text
            load-font
            load-font-data
            load-font-ex
            load-font-from-image
            load-font-from-memory
            load-image
            load-image-anim
            load-image-anim-from-memory
            load-image-colors
            load-image-from-memory
            load-image-from-screen
            load-image-from-texture
            load-image-palette
            load-image-raw
            load-material-default
            load-materials
            load-model
            load-model-animations
            load-model-from-mesh
            load-music-stream
            load-music-stream-from-memory
            load-random-sequence
            load-render-texture
            load-shader
            load-shader-from-memory
            load-sound
            load-sound-alias
            load-sound-from-wave
            load-text-lines
            load-texture
            load-texture-cubemap
            load-texture-from-image
            load-utf8
            load-vr-stereo-config
            load-wave
            load-wave-from-memory
            load-wave-samples
            make-audio-stream
            make-automation-event
            make-automation-event-list
            make-bone-info
            make-bounding-box
            make-camera
            make-camera-2d
            make-camera-3d
            make-color
            make-directory
            make-file-path-list
            make-font
            make-glyph-info
            make-image
            make-material
            make-material-map
            make-matrix
            make-mesh
            make-model
            make-model-animation
            make-music
            make-n-patch-info
            make-quaternion
            make-ray
            make-ray-collision
            make-rectangle
            make-render-texture
            make-render-texture-2d
            make-shader
            make-skeleton
            make-sound
            make-texture
            make-texture-2d
            make-texture-cubemap
            make-transform
            make-vector2
            make-vector3
            make-vector4
            make-vr-device-info
            make-vr-stereo-config
            make-wave
            material
            material-map
            material-map-color
            material-map-index
            material-map-p
            material-map-texture
            material-map-value
            material-maps
            material-p
            material-params
            material-shader
            matrix
            matrix-m0
            matrix-m1
            matrix-m10
            matrix-m11
            matrix-m12
            matrix-m13
            matrix-m14
            matrix-m15
            matrix-m2
            matrix-m3
            matrix-m4
            matrix-m5
            matrix-m6
            matrix-m7
            matrix-m8
            matrix-m9
            matrix-p
            maximize-window
            measure-text
            measure-text-codepoints
            measure-text-ex
            mem-alloc
            mem-free
            mem-realloc
            mesh
            mesh-anim-normals
            mesh-anim-vertices
            mesh-bone-count
            mesh-bone-indices
            mesh-bone-weights
            mesh-colors
            mesh-indices
            mesh-normals
            mesh-p
            mesh-tangents
            mesh-texcoords
            mesh-texcoords2
            mesh-triangle-count
            mesh-vao-id
            mesh-vbo-id
            mesh-vertex-count
            mesh-vertices
            minimize-window
            model
            model-animation
            model-animation-bone-count
            model-animation-keyframe-count
            model-animation-keyframe-poses
            model-animation-name
            model-animation-p
            model-bone-matrices
            model-current-pose
            model-material-count
            model-materials
            model-mesh-count
            model-mesh-material
            model-meshes
            model-p
            model-skeleton
            model-transform
            mouse-button
            mouse-cursor
            music
            music-ctx-data
            music-ctx-type
            music-frame-count
            music-looping
            music-p
            music-stream
            n-patch-info
            n-patch-info-bottom
            n-patch-info-layout
            n-patch-info-left
            n-patch-info-p
            n-patch-info-right
            n-patch-info-source
            n-patch-info-top
            n-patch-layout
            open-url
            pause-audio-stream
            pause-music-stream
            pause-sound
            pixel-format
            play-audio-stream
            play-automation-event
            play-music-stream
            play-sound
            poll-input-events
            quaternion
            ray
            ray-collision
            ray-collision-distance
            ray-collision-hit
            ray-collision-normal
            ray-collision-p
            ray-collision-point
            ray-direction
            ray-p
            ray-position
            rectangle
            rectangle-height
            rectangle-p
            rectangle-width
            rectangle-x
            rectangle-y
            render-texture
            render-texture-2d
            render-texture-depth
            render-texture-id
            render-texture-p
            render-texture-texture
            restore-window
            resume-audio-stream
            resume-music-stream
            resume-sound
            save-file-data
            save-file-text
            seek-music-stream
            set-audio-stream-buffer-size-default
            set-audio-stream-callback
            set-audio-stream-pan
            set-audio-stream-pitch
            set-audio-stream-volume
            set-automation-event-base-frame
            set-automation-event-list
            set-clipboard-text
            set-config-flags
            set-exit-key
            set-gamepad-mappings
            set-gamepad-vibration
            set-gestures-enabled
            set-load-file-data-callback
            set-load-file-text-callback
            set-master-volume
            set-material-texture
            set-model-mesh-material
            set-mouse-cursor
            set-mouse-offset
            set-mouse-position
            set-mouse-scale
            set-music-pan
            set-music-pitch
            set-music-volume
            set-pixel-color
            set-random-seed
            set-save-file-data-callback
            set-save-file-text-callback
            set-shader-value
            set-shader-value-matrix
            set-shader-value-texture
            set-shader-value-v
            set-shapes-texture
            set-sound-pan
            set-sound-pitch
            set-sound-volume
            set-target-fps
            set-text-line-spacing
            set-texture-filter
            set-texture-wrap
            set-trace-log-callback
            set-trace-log-level
            set-window-focused
            set-window-icon
            set-window-icons
            set-window-max-size
            set-window-min-size
            set-window-monitor
            set-window-opacity
            set-window-position
            set-window-size
            set-window-state
            set-window-title
            shader
            shader-attribute-data-type
            shader-id
            shader-location-index
            shader-locs
            shader-p
            shader-uniform-data-type
            show-cursor
            skeleton
            skeleton-bind-pose
            skeleton-bone-count
            skeleton-bones
            skeleton-p
            sound
            sound-frame-count
            sound-p
            sound-stream
            start-automation-event-recording
            stop-audio-stream
            stop-automation-event-recording
            stop-music-stream
            stop-sound
            swap-screen-buffer
            take-screenshot
            text-append
            text-copy
            text-find-index
            text-insert
            text-insert-alloc
            text-is-equal
            text-join
            text-length
            text-remove-spaces
            text-replace
            text-replace-alloc
            text-replace-between
            text-replace-between-alloc
            text-split
            text-subtext
            text-to-camel
            text-to-float
            text-to-integer
            text-to-lower
            text-to-pascal
            text-to-snake
            text-to-upper
            texture
            texture-2d
            texture-cubemap
            texture-filter
            texture-height
            texture-id
            texture-mipmap-count
            texture-p
            texture-pixel-format
            texture-width
            texture-wrap
            toggle-borderless-windowed
            toggle-fullscreen
            trace-log-level
            transform
            transform-p
            transform-rotation
            transform-scale
            transform-translation
            unload-audio-stream
            unload-automation-event-list
            unload-codepoints
            unload-directory-files
            unload-dropped-files
            unload-file-data
            unload-file-text
            unload-font
            unload-font-data
            unload-image
            unload-image-colors
            unload-image-palette
            unload-material
            unload-mesh
            unload-model
            unload-model-animations
            unload-music-stream
            unload-random-sequence
            unload-render-texture
            unload-shader
            unload-sound
            unload-sound-alias
            unload-text-lines
            unload-texture
            unload-utf8
            unload-vr-stereo-config
            unload-wave
            unload-wave-samples
            update-audio-stream
            update-camera
            update-camera-pro
            update-mesh-buffer
            update-model-animation
            update-model-animation-ex
            update-music-stream
            update-sound
            update-texture
            update-texture-rec
            upload-mesh
            vector2
            vector2-p
            vector2-x
            vector2-y
            vector3
            vector3-p
            vector3-x
            vector3-y
            vector3-z
            vector4
            vector4-p
            vector4-w
            vector4-x
            vector4-y
            vector4-z
            vr-device-info
            vr-device-info-chroma-ab-correction
            vr-device-info-eye-to-screen-distance
            vr-device-info-h-resolution
            vr-device-info-h-screen-size
            vr-device-info-interpupillary-distance
            vr-device-info-lens-distortion-values
            vr-device-info-lens-separation-distance
            vr-device-info-p
            vr-device-info-v-resolution
            vr-device-info-v-screen-size
            vr-stereo-config
            vr-stereo-config-left-lens-center
            vr-stereo-config-left-screen-center
            vr-stereo-config-p
            vr-stereo-config-projection
            vr-stereo-config-right-lens-center
            vr-stereo-config-right-screen-center
            vr-stereo-config-scale
            vr-stereo-config-scale-in
            vr-stereo-config-view-offset
            wait-time
            wave
            wave-channels
            wave-copy
            wave-crop
            wave-data
            wave-format
            wave-frame-count
            wave-p
            wave-sample-rate
            wave-sample-size
            window-should-close)))

(defparameter +raylib-version+ "6.0"
  "The raylib version these bindings were generated for.")

;;; Enums

(define-enum config-flags
  "System/Window config flags."
  (:vsync-hint 64)
  (:fullscreen-mode 2)
  (:window-resizable 4)
  (:window-undecorated 8)
  (:window-hidden 128)
  (:window-minimized 512)
  (:window-maximized 1024)
  (:window-unfocused 2048)
  (:window-topmost 4096)
  (:window-always-run 256)
  (:window-transparent 16)
  (:window-highdpi 8192)
  (:window-mouse-passthrough 16384)
  (:borderless-windowed-mode 32768)
  (:msaa-4x-hint 32)
  (:interlaced-hint 65536))

(define-enum trace-log-level
  "Trace log level."
  (:all 0)
  (:trace 1)
  (:debug 2)
  (:info 3)
  (:warning 4)
  (:error 5)
  (:fatal 6)
  (:none 7))

(define-enum keyboard-key
  "Keyboard keys (US keyboard layout)."
  (:null 0)
  (:apostrophe 39)
  (:comma 44)
  (:minus 45)
  (:period 46)
  (:slash 47)
  (:zero 48)
  (:one 49)
  (:two 50)
  (:three 51)
  (:four 52)
  (:five 53)
  (:six 54)
  (:seven 55)
  (:eight 56)
  (:nine 57)
  (:semicolon 59)
  (:equal 61)
  (:a 65)
  (:b 66)
  (:c 67)
  (:d 68)
  (:e 69)
  (:f 70)
  (:g 71)
  (:h 72)
  (:i 73)
  (:j 74)
  (:k 75)
  (:l 76)
  (:m 77)
  (:n 78)
  (:o 79)
  (:p 80)
  (:q 81)
  (:r 82)
  (:s 83)
  (:t 84)
  (:u 85)
  (:v 86)
  (:w 87)
  (:x 88)
  (:y 89)
  (:z 90)
  (:left-bracket 91)
  (:backslash 92)
  (:right-bracket 93)
  (:grave 96)
  (:space 32)
  (:escape 256)
  (:enter 257)
  (:tab 258)
  (:backspace 259)
  (:insert 260)
  (:delete 261)
  (:right 262)
  (:left 263)
  (:down 264)
  (:up 265)
  (:page-up 266)
  (:page-down 267)
  (:home 268)
  (:end 269)
  (:caps-lock 280)
  (:scroll-lock 281)
  (:num-lock 282)
  (:print-screen 283)
  (:pause 284)
  (:f1 290)
  (:f2 291)
  (:f3 292)
  (:f4 293)
  (:f5 294)
  (:f6 295)
  (:f7 296)
  (:f8 297)
  (:f9 298)
  (:f10 299)
  (:f11 300)
  (:f12 301)
  (:left-shift 340)
  (:left-control 341)
  (:left-alt 342)
  (:left-super 343)
  (:right-shift 344)
  (:right-control 345)
  (:right-alt 346)
  (:right-super 347)
  (:kb-menu 348)
  (:kp-0 320)
  (:kp-1 321)
  (:kp-2 322)
  (:kp-3 323)
  (:kp-4 324)
  (:kp-5 325)
  (:kp-6 326)
  (:kp-7 327)
  (:kp-8 328)
  (:kp-9 329)
  (:kp-decimal 330)
  (:kp-divide 331)
  (:kp-multiply 332)
  (:kp-subtract 333)
  (:kp-add 334)
  (:kp-enter 335)
  (:kp-equal 336)
  (:back 4)
  (:menu 5)
  (:volume-up 24)
  (:volume-down 25))

(define-enum mouse-button
  "Mouse buttons."
  (:left 0)
  (:right 1)
  (:middle 2)
  (:side 3)
  (:extra 4)
  (:forward 5)
  (:back 6))

(define-enum mouse-cursor
  "Mouse cursor."
  (:default 0)
  (:arrow 1)
  (:ibeam 2)
  (:crosshair 3)
  (:pointing-hand 4)
  (:resize-ew 5)
  (:resize-ns 6)
  (:resize-nwse 7)
  (:resize-nesw 8)
  (:resize-all 9)
  (:not-allowed 10))

(define-enum gamepad-button
  "Gamepad buttons."
  (:unknown 0)
  (:left-face-up 1)
  (:left-face-right 2)
  (:left-face-down 3)
  (:left-face-left 4)
  (:right-face-up 5)
  (:right-face-right 6)
  (:right-face-down 7)
  (:right-face-left 8)
  (:left-trigger-1 9)
  (:left-trigger-2 10)
  (:right-trigger-1 11)
  (:right-trigger-2 12)
  (:middle-left 13)
  (:middle 14)
  (:middle-right 15)
  (:left-thumb 16)
  (:right-thumb 17))

(define-enum gamepad-axis
  "Gamepad axes."
  (:left-x 0)
  (:left-y 1)
  (:right-x 2)
  (:right-y 3)
  (:left-trigger 4)
  (:right-trigger 5))

(define-enum material-map-index
  "Material map index."
  (:albedo 0)
  (:metalness 1)
  (:normal 2)
  (:roughness 3)
  (:occlusion 4)
  (:emission 5)
  (:height 6)
  (:cubemap 7)
  (:irradiance 8)
  (:prefilter 9)
  (:brdf 10)
  (:diffuse 0)
  (:specular 1))

(define-enum shader-location-index
  "Shader location index."
  (:vertex-position 0)
  (:vertex-texcoord01 1)
  (:vertex-texcoord02 2)
  (:vertex-normal 3)
  (:vertex-tangent 4)
  (:vertex-color 5)
  (:matrix-mvp 6)
  (:matrix-view 7)
  (:matrix-projection 8)
  (:matrix-model 9)
  (:matrix-normal 10)
  (:vector-view 11)
  (:color-diffuse 12)
  (:color-specular 13)
  (:color-ambient 14)
  (:map-albedo 15)
  (:map-metalness 16)
  (:map-normal 17)
  (:map-roughness 18)
  (:map-occlusion 19)
  (:map-emission 20)
  (:map-height 21)
  (:map-cubemap 22)
  (:map-irradiance 23)
  (:map-prefilter 24)
  (:map-brdf 25)
  (:vertex-boneids 26)
  (:vertex-boneweights 27)
  (:matrix-bonetransforms 28)
  (:vertex-instancetransform 29)
  (:map-diffuse 15)
  (:map-specular 16))

(define-enum shader-uniform-data-type
  "Shader uniform data type."
  (:float 0)
  (:vec2 1)
  (:vec3 2)
  (:vec4 3)
  (:int 4)
  (:ivec2 5)
  (:ivec3 6)
  (:ivec4 7)
  (:uint 8)
  (:uivec2 9)
  (:uivec3 10)
  (:uivec4 11)
  (:sampler2d 12))

(define-enum shader-attribute-data-type
  "Shader attribute data types."
  (:float 0)
  (:vec2 1)
  (:vec3 2)
  (:vec4 3))

(define-enum pixel-format
  "Pixel formats."
  (:uncompressed-grayscale 1)
  (:uncompressed-gray-alpha 2)
  (:uncompressed-r5g6b5 3)
  (:uncompressed-r8g8b8 4)
  (:uncompressed-r5g5b5a1 5)
  (:uncompressed-r4g4b4a4 6)
  (:uncompressed-r8g8b8a8 7)
  (:uncompressed-r32 8)
  (:uncompressed-r32g32b32 9)
  (:uncompressed-r32g32b32a32 10)
  (:uncompressed-r16 11)
  (:uncompressed-r16g16b16 12)
  (:uncompressed-r16g16b16a16 13)
  (:compressed-dxt1-rgb 14)
  (:compressed-dxt1-rgba 15)
  (:compressed-dxt3-rgba 16)
  (:compressed-dxt5-rgba 17)
  (:compressed-etc1-rgb 18)
  (:compressed-etc2-rgb 19)
  (:compressed-etc2-eac-rgba 20)
  (:compressed-pvrt-rgb 21)
  (:compressed-pvrt-rgba 22)
  (:compressed-astc-4x4-rgba 23)
  (:compressed-astc-8x8-rgba 24))

(define-enum texture-filter
  "Texture parameters: filter mode."
  (:point 0)
  (:bilinear 1)
  (:trilinear 2)
  (:anisotropic-4x 3)
  (:anisotropic-8x 4)
  (:anisotropic-16x 5))

(define-enum texture-wrap
  "Texture parameters: wrap mode."
  (:repeat 0)
  (:clamp 1)
  (:mirror-repeat 2)
  (:mirror-clamp 3))

(define-enum cubemap-layout
  "Cubemap layouts."
  (:auto-detect 0)
  (:line-vertical 1)
  (:line-horizontal 2)
  (:cross-three-by-four 3)
  (:cross-four-by-three 4))

(define-enum font-type
  "Font type, defines generation method."
  (:default 0)
  (:bitmap 1)
  (:sdf 2))

(define-enum blend-mode
  "Color blending modes (pre-defined)."
  (:alpha 0)
  (:additive 1)
  (:multiplied 2)
  (:add-colors 3)
  (:subtract-colors 4)
  (:alpha-premultiply 5)
  (:custom 6)
  (:custom-separate 7))

(define-enum gesture
  "Gesture."
  (:none 0)
  (:tap 1)
  (:doubletap 2)
  (:hold 4)
  (:drag 8)
  (:swipe-right 16)
  (:swipe-left 32)
  (:swipe-up 64)
  (:swipe-down 128)
  (:pinch-in 256)
  (:pinch-out 512))

(define-enum camera-mode
  "Camera system modes."
  (:custom 0)
  (:free 1)
  (:orbital 2)
  (:first-person 3)
  (:third-person 4))

(define-enum camera-projection
  "Camera projection."
  (:perspective 0)
  (:orthographic 1))

(define-enum n-patch-layout
  "N-patch layout."
  (:nine-patch 0)
  (:three-patch-vertical 1)
  (:three-patch-horizontal 2))

;;; Colors

(define-colors
  (:lightgray 200 200 200 255)
  (:gray 130 130 130 255)
  (:darkgray 80 80 80 255)
  (:yellow 253 249 0 255)
  (:gold 255 203 0 255)
  (:orange 255 161 0 255)
  (:pink 255 109 194 255)
  (:red 230 41 55 255)
  (:maroon 190 33 55 255)
  (:green 0 228 48 255)
  (:lime 0 158 47 255)
  (:darkgreen 0 117 44 255)
  (:skyblue 102 191 255 255)
  (:blue 0 121 241 255)
  (:darkblue 0 82 172 255)
  (:purple 200 122 255 255)
  (:violet 135 60 190 255)
  (:darkpurple 112 31 126 255)
  (:beige 211 176 131 255)
  (:brown 127 106 79 255)
  (:darkbrown 76 63 47 255)
  (:white 255 255 255 255)
  (:black 0 0 0 255)
  (:blank 0 0 0 0)
  (:magenta 255 0 255 255)
  (:raywhite 245 245 245 255))

;;; Structs

(define-struct vector2
  "Vector2, 2 components."
  (x :float)
  (y :float))

(define-struct vector3
  "Vector3, 3 components."
  (x :float)
  (y :float)
  (z :float))

(define-struct vector4
  "Vector4, 4 components."
  (x :float)
  (y :float)
  (z :float)
  (w :float))

(define-struct matrix
  "Matrix, 4x4 components, column major, OpenGL style, right-handed."
  (m0 :float)
  (m4 :float)
  (m8 :float)
  (m12 :float)
  (m1 :float)
  (m5 :float)
  (m9 :float)
  (m13 :float)
  (m2 :float)
  (m6 :float)
  (m10 :float)
  (m14 :float)
  (m3 :float)
  (m7 :float)
  (m11 :float)
  (m15 :float))

(define-struct color
  "Color, 4 components, R8G8B8A8 (32bit)."
  (r :uchar)
  (g :uchar)
  (b :uchar)
  (a :uchar :initform 255))

(define-struct rectangle
  "Rectangle, 4 components."
  (x :float)
  (y :float)
  (width :float)
  (height :float))

(define-struct image
  "Image, pixel data stored in CPU memory (RAM)."
  (data :pointer)
  (width :int)
  (height :int)
  (mipmap-count :int)
  (pixel-format (:enum pixel-format)))

(define-struct texture
  "Texture, tex data stored in GPU memory (VRAM)."
  (id :uint)
  (width :int)
  (height :int)
  (mipmap-count :int)
  (pixel-format (:enum pixel-format)))

(define-struct render-texture
  "RenderTexture, fbo for texture rendering."
  (id :uint)
  (texture (:struct texture))
  (depth (:struct texture)))

(define-struct n-patch-info
  "NPatchInfo, n-patch layout info."
  (source (:struct rectangle))
  (left :int)
  (top :int)
  (right :int)
  (bottom :int)
  (layout (:enum n-patch-layout)))

(define-struct glyph-info
  "GlyphInfo, font characters glyphs info."
  (value :int)
  (offset-x :int)
  (offset-y :int)
  (advance-x :int)
  (image (:struct image)))

(define-struct font
  "Font, font texture and GlyphInfo array data."
  (base-size :int)
  (glyph-count :int)
  (glyph-padding :int)
  (texture (:struct texture))
  (recs :pointer)
  (glyphs :pointer))

(define-struct camera-3d
  "Camera, defines position/orientation in 3d space."
  (position (:struct vector3))
  (target (:struct vector3))
  (up (:struct vector3) :initform (make-vector3 :y 1.0))
  (fovy :float :initform 45.0)
  (projection (:enum camera-projection)))

(define-struct camera-2d
  "Camera2D, defines position/orientation in 2d space."
  (offset (:struct vector2))
  (target (:struct vector2))
  (rotation :float)
  (zoom :float :initform 1.0))

(define-struct mesh
  "Mesh, vertex data and vao/vbo."
  (vertex-count :int)
  (triangle-count :int)
  (vertices :pointer)
  (texcoords :pointer)
  (texcoords2 :pointer)
  (normals :pointer)
  (tangents :pointer)
  (colors :pointer)
  (indices :pointer)
  (bone-count :int)
  (bone-indices :pointer)
  (bone-weights :pointer)
  (anim-vertices :pointer)
  (anim-normals :pointer)
  (vao-id :uint)
  (vbo-id :pointer))

(define-struct shader
  "Shader."
  (id :uint)
  (locs :pointer))

(define-struct material-map
  "MaterialMap."
  (texture (:struct texture))
  (color (:struct color))
  (value :float))

(define-struct material
  "Material, includes shader and maps."
  (shader (:struct shader))
  (maps :pointer)
  (params (:array :float 4)))

(define-struct transform
  "Transform, vertex transformation data."
  (translation (:struct vector3))
  (rotation (:struct vector4))
  (scale (:struct vector3)))

(define-struct bone-info
  "Bone, skeletal animation bone."
  (name (:string 32))
  (parent :int))

(define-struct skeleton
  "Skeleton, animation bones hierarchy."
  (bone-count :int)
  (bones :pointer)
  (bind-pose :pointer))

(define-struct model
  "Model, meshes, materials and animation data."
  (transform (:struct matrix))
  (mesh-count :int)
  (material-count :int)
  (meshes :pointer)
  (materials :pointer)
  (mesh-material :pointer)
  (skeleton (:struct skeleton))
  (current-pose :pointer)
  (bone-matrices :pointer))

(define-struct model-animation
  "ModelAnimation, contains a full animation sequence."
  (name (:string 32))
  (bone-count :int)
  (keyframe-count :int)
  (keyframe-poses :pointer))

(define-struct ray
  "Ray, ray for raycasting."
  (position (:struct vector3))
  (direction (:struct vector3)))

(define-struct ray-collision
  "RayCollision, ray hit information."
  (hit :bool)
  (distance :float)
  (point (:struct vector3))
  (normal (:struct vector3)))

(define-struct bounding-box
  "BoundingBox."
  (min (:struct vector3))
  (max (:struct vector3)))

(define-struct wave
  "Wave, audio wave data."
  (frame-count :uint)
  (sample-rate :uint)
  (sample-size :uint)
  (channels :uint)
  (data :pointer))

(define-struct audio-stream
  "AudioStream, custom audio stream."
  (buffer :pointer)
  (processor :pointer)
  (sample-rate :uint)
  (sample-size :uint)
  (channels :uint))

(define-struct sound
  "Sound."
  (stream (:struct audio-stream))
  (frame-count :uint))

(define-struct music
  "Music, audio stream, anything longer than ~10 seconds should be streamed."
  (stream (:struct audio-stream))
  (frame-count :uint)
  (looping :bool)
  (ctx-type :int)
  (ctx-data :pointer))

(define-struct vr-device-info
  "VrDeviceInfo, Head-Mounted-Display device parameters."
  (h-resolution :int)
  (v-resolution :int)
  (h-screen-size :float)
  (v-screen-size :float)
  (eye-to-screen-distance :float)
  (lens-separation-distance :float)
  (interpupillary-distance :float)
  (lens-distortion-values (:array :float 4))
  (chroma-ab-correction (:array :float 4)))

(define-struct vr-stereo-config
  "VrStereoConfig, VR stereo rendering configuration for simulator."
  (projection (:array (:struct matrix) 2))
  (view-offset (:array (:struct matrix) 2))
  (left-lens-center (:array :float 2))
  (right-lens-center (:array :float 2))
  (left-screen-center (:array :float 2))
  (right-screen-center (:array :float 2))
  (scale (:array :float 2))
  (scale-in (:array :float 2)))

(define-struct file-path-list
  "File path list."
  (count :uint)
  (paths :pointer))

(define-struct automation-event
  "Automation event."
  (frame :uint)
  (type :uint)
  (params (:array :int 4)))

(define-struct automation-event-list
  "Automation event list."
  (capacity :uint)
  (count :uint)
  (events :pointer))

(define-struct-alias camera camera-3d)
(define-struct-alias quaternion vector4)
(define-struct-alias render-texture-2d render-texture)
(define-struct-alias texture-2d texture)
(define-struct-alias texture-cubemap texture)

(define-struct-order
  vector2
  vector3
  vector4
  matrix
  color
  rectangle
  image
  texture
  render-texture
  n-patch-info
  glyph-info
  font
  camera-3d
  camera-2d
  mesh
  shader
  material-map
  material
  transform
  bone-info
  skeleton
  model
  model-animation
  ray
  ray-collision
  bounding-box
  wave
  audio-stream
  sound
  music
  vr-device-info
  vr-stereo-config
  file-path-list
  automation-event
  automation-event-list)

;;; Functions

(define-function ("InitWindow" init-window) :void
  "Initialize window and OpenGL context.

C: void InitWindow(int width, int height, const char *title)"
  (width :int)
  (height :int)
  (title :string))

(define-function ("CloseWindow" close-window) :void
  "Close window and unload OpenGL context.

C: void CloseWindow()")

(define-function ("WindowShouldClose" window-should-close) :bool
  "Check if application should close (KEY_ESCAPE pressed or windows close icon clicked).

C: bool WindowShouldClose()")

(define-function ("IsWindowReady" is-window-ready) :bool
  "Check if window has been initialized successfully.

C: bool IsWindowReady()")

(define-function ("IsWindowFullscreen" is-window-fullscreen) :bool
  "Check if window is currently fullscreen.

C: bool IsWindowFullscreen()")

(define-function ("IsWindowHidden" is-window-hidden) :bool
  "Check if window is currently hidden.

C: bool IsWindowHidden()")

(define-function ("IsWindowMinimized" is-window-minimized) :bool
  "Check if window is currently minimized.

C: bool IsWindowMinimized()")

(define-function ("IsWindowMaximized" is-window-maximized) :bool
  "Check if window is currently maximized.

C: bool IsWindowMaximized()")

(define-function ("IsWindowFocused" is-window-focused) :bool
  "Check if window is currently focused.

C: bool IsWindowFocused()")

(define-function ("IsWindowResized" is-window-resized) :bool
  "Check if window has been resized last frame.

C: bool IsWindowResized()")

(define-function ("IsWindowState" is-window-state) :bool
  "Check if one specific window flag is enabled.

C: bool IsWindowState(unsigned int flag)"
  (flag (:enum config-flags :uint)))

(define-function ("SetWindowState" set-window-state) :void
  "Set window configuration state using flags.

C: void SetWindowState(unsigned int flags)"
  (flags (:enum config-flags :uint)))

(define-function ("ClearWindowState" clear-window-state) :void
  "Clear window configuration state flags.

C: void ClearWindowState(unsigned int flags)"
  (flags (:enum config-flags :uint)))

(define-function ("ToggleFullscreen" toggle-fullscreen) :void
  "Toggle window state: fullscreen/windowed, resizes monitor to match window resolution.

C: void ToggleFullscreen()")

(define-function ("ToggleBorderlessWindowed" toggle-borderless-windowed) :void
  "Toggle window state: borderless windowed, resizes window to match monitor resolution.

C: void ToggleBorderlessWindowed()")

(define-function ("MaximizeWindow" maximize-window) :void
  "Set window state: maximized, if resizable.

C: void MaximizeWindow()")

(define-function ("MinimizeWindow" minimize-window) :void
  "Set window state: minimized, if resizable.

C: void MinimizeWindow()")

(define-function ("RestoreWindow" restore-window) :void
  "Restore window from being minimized/maximized.

C: void RestoreWindow()")

(define-function ("SetWindowIcon" set-window-icon) :void
  "Set icon for window (single image, RGBA 32bit).

C: void SetWindowIcon(Image image)"
  (image (:struct image)))

(define-function ("SetWindowIcons" set-window-icons) :void
  "Set icon for window (multiple images, RGBA 32bit).

C: void SetWindowIcons(Image *images, int count)"
  (images :pointer)
  (count :int))

(define-function ("SetWindowTitle" set-window-title) :void
  "Set title for window.

C: void SetWindowTitle(const char *title)"
  (title :string))

(define-function ("SetWindowPosition" set-window-position) :void
  "Set window position on screen.

C: void SetWindowPosition(int x, int y)"
  (x :int)
  (y :int))

(define-function ("SetWindowMonitor" set-window-monitor) :void
  "Set monitor for the current window.

C: void SetWindowMonitor(int monitor)"
  (monitor :int))

(define-function ("SetWindowMinSize" set-window-min-size) :void
  "Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE).

C: void SetWindowMinSize(int width, int height)"
  (width :int)
  (height :int))

(define-function ("SetWindowMaxSize" set-window-max-size) :void
  "Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE).

C: void SetWindowMaxSize(int width, int height)"
  (width :int)
  (height :int))

(define-function ("SetWindowSize" set-window-size) :void
  "Set window dimensions.

C: void SetWindowSize(int width, int height)"
  (width :int)
  (height :int))

(define-function ("SetWindowOpacity" set-window-opacity) :void
  "Set window opacity [0.0f..1.0f].

C: void SetWindowOpacity(float opacity)"
  (opacity :float))

(define-function ("SetWindowFocused" set-window-focused) :void
  "Set window focused.

C: void SetWindowFocused()")

(define-function ("GetWindowHandle" get-window-handle) :pointer
  "Get native window handle.

C: void * GetWindowHandle()")

(define-function ("GetScreenWidth" get-screen-width) :int
  "Get current screen width.

C: int GetScreenWidth()")

(define-function ("GetScreenHeight" get-screen-height) :int
  "Get current screen height.

C: int GetScreenHeight()")

(define-function ("GetRenderWidth" get-render-width) :int
  "Get current render width (it considers HiDPI).

C: int GetRenderWidth()")

(define-function ("GetRenderHeight" get-render-height) :int
  "Get current render height (it considers HiDPI).

C: int GetRenderHeight()")

(define-function ("GetMonitorCount" get-monitor-count) :int
  "Get number of connected monitors.

C: int GetMonitorCount()")

(define-function ("GetCurrentMonitor" get-current-monitor) :int
  "Get current monitor where window is placed.

C: int GetCurrentMonitor()")

(define-function ("GetMonitorPosition" get-monitor-position) (:struct vector2)
  "Get specified monitor position.

C: Vector2 GetMonitorPosition(int monitor)"
  (monitor :int))

(define-function ("GetMonitorWidth" get-monitor-width) :int
  "Get specified monitor width (current video mode used by monitor).

C: int GetMonitorWidth(int monitor)"
  (monitor :int))

(define-function ("GetMonitorHeight" get-monitor-height) :int
  "Get specified monitor height (current video mode used by monitor).

C: int GetMonitorHeight(int monitor)"
  (monitor :int))

(define-function ("GetMonitorPhysicalWidth" get-monitor-physical-width) :int
  "Get specified monitor physical width in millimetres.

C: int GetMonitorPhysicalWidth(int monitor)"
  (monitor :int))

(define-function ("GetMonitorPhysicalHeight" get-monitor-physical-height) :int
  "Get specified monitor physical height in millimetres.

C: int GetMonitorPhysicalHeight(int monitor)"
  (monitor :int))

(define-function ("GetMonitorRefreshRate" get-monitor-refresh-rate) :int
  "Get specified monitor refresh rate.

C: int GetMonitorRefreshRate(int monitor)"
  (monitor :int))

(define-function ("GetWindowPosition" get-window-position) (:struct vector2)
  "Get window position XY on monitor.

C: Vector2 GetWindowPosition()")

(define-function ("GetWindowScaleDPI" get-window-scale-dpi) (:struct vector2)
  "Get window scale DPI factor.

C: Vector2 GetWindowScaleDPI()")

(define-function ("GetMonitorName" get-monitor-name) :string
  "Get the human-readable, UTF-8 encoded name of the specified monitor.

C: const char * GetMonitorName(int monitor)"
  (monitor :int))

(define-function ("SetClipboardText" set-clipboard-text) :void
  "Set clipboard text content.

C: void SetClipboardText(const char *text)"
  (text :string))

(define-function ("GetClipboardText" get-clipboard-text) :string
  "Get clipboard text content.

C: const char * GetClipboardText()")

(define-function ("GetClipboardImage" get-clipboard-image) (:struct image)
  "Get clipboard image content.

C: Image GetClipboardImage()")

(define-function ("EnableEventWaiting" enable-event-waiting) :void
  "Enable waiting for events on EndDrawing(), no automatic event polling.

C: void EnableEventWaiting()")

(define-function ("DisableEventWaiting" disable-event-waiting) :void
  "Disable waiting for events on EndDrawing(), automatic events polling.

C: void DisableEventWaiting()")

(define-function ("ShowCursor" show-cursor) :void
  "Shows cursor.

C: void ShowCursor()")

(define-function ("HideCursor" hide-cursor) :void
  "Hides cursor.

C: void HideCursor()")

(define-function ("IsCursorHidden" is-cursor-hidden) :bool
  "Check if cursor is not visible.

C: bool IsCursorHidden()")

(define-function ("EnableCursor" enable-cursor) :void
  "Enables cursor (unlock cursor).

C: void EnableCursor()")

(define-function ("DisableCursor" disable-cursor) :void
  "Disables cursor (lock cursor).

C: void DisableCursor()")

(define-function ("IsCursorOnScreen" is-cursor-on-screen) :bool
  "Check if cursor is on the screen.

C: bool IsCursorOnScreen()")

(define-function ("ClearBackground" clear-background) :void
  "Set background color (framebuffer clear color).

C: void ClearBackground(Color color)"
  (color (:struct color)))

(define-function ("BeginDrawing" begin-drawing) :void
  "Setup canvas (framebuffer) to start drawing.

C: void BeginDrawing()")

(define-function ("EndDrawing" end-drawing) :void
  "End canvas drawing and swap buffers (double buffering).

C: void EndDrawing()")

(define-function ("BeginMode2D" begin-mode-2d) :void
  "Begin 2D mode with custom camera (2D).

C: void BeginMode2D(Camera2D camera)"
  (camera (:struct camera-2d)))

(define-function ("EndMode2D" end-mode-2d) :void
  "Ends 2D mode with custom camera.

C: void EndMode2D()")

(define-function ("BeginMode3D" begin-mode-3d) :void
  "Begin 3D mode with custom camera (3D).

C: void BeginMode3D(Camera3D camera)"
  (camera (:struct camera-3d)))

(define-function ("EndMode3D" end-mode-3d) :void
  "Ends 3D mode and returns to default 2D orthographic mode.

C: void EndMode3D()")

(define-function ("BeginTextureMode" begin-texture-mode) :void
  "Begin drawing to render texture.

C: void BeginTextureMode(RenderTexture2D target)"
  (target (:struct render-texture)))

(define-function ("EndTextureMode" end-texture-mode) :void
  "Ends drawing to render texture.

C: void EndTextureMode()")

(define-function ("BeginShaderMode" begin-shader-mode) :void
  "Begin custom shader drawing.

C: void BeginShaderMode(Shader shader)"
  (shader (:struct shader)))

(define-function ("EndShaderMode" end-shader-mode) :void
  "End custom shader drawing (use default shader).

C: void EndShaderMode()")

(define-function ("BeginBlendMode" begin-blend-mode) :void
  "Begin blending mode (alpha, additive, multiplied, subtract, custom).

C: void BeginBlendMode(int mode)"
  (mode (:enum blend-mode)))

(define-function ("EndBlendMode" end-blend-mode) :void
  "End blending mode (reset to default: alpha blending).

C: void EndBlendMode()")

(define-function ("BeginScissorMode" begin-scissor-mode) :void
  "Begin scissor mode (define screen area for following drawing).

C: void BeginScissorMode(int x, int y, int width, int height)"
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(define-function ("EndScissorMode" end-scissor-mode) :void
  "End scissor mode.

C: void EndScissorMode()")

(define-function ("BeginVrStereoMode" begin-vr-stereo-mode) :void
  "Begin stereo rendering (requires VR simulator).

C: void BeginVrStereoMode(VrStereoConfig config)"
  (config (:struct vr-stereo-config)))

(define-function ("EndVrStereoMode" end-vr-stereo-mode) :void
  "End stereo rendering (requires VR simulator).

C: void EndVrStereoMode()")

(define-function ("LoadVrStereoConfig" load-vr-stereo-config) (:struct vr-stereo-config)
  "Load VR stereo config for VR simulator device parameters.

C: VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device)"
  (device (:struct vr-device-info)))

(define-function ("UnloadVrStereoConfig" unload-vr-stereo-config) :void
  "Unload VR stereo config.

C: void UnloadVrStereoConfig(VrStereoConfig config)"
  (config (:struct vr-stereo-config)))

(define-function ("LoadShader" load-shader) (:struct shader)
  "Load shader from files and bind default locations.

C: Shader LoadShader(const char *vsFileName, const char *fsFileName)"
  (vs-file-name :string)
  (fs-file-name :string))

(define-function ("LoadShaderFromMemory" load-shader-from-memory) (:struct shader)
  "Load shader from code strings and bind default locations.

C: Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode)"
  (vs-code :string)
  (fs-code :string))

(define-function ("IsShaderValid" is-shader-valid) :bool
  "Check if a shader is valid (loaded on GPU).

C: bool IsShaderValid(Shader shader)"
  (shader (:struct shader)))

(define-function ("GetShaderLocation" get-shader-location) :int
  "Get shader uniform location.

C: int GetShaderLocation(Shader shader, const char *uniformName)"
  (shader (:struct shader))
  (uniform-name :string))

(define-function ("GetShaderLocationAttrib" get-shader-location-attrib) :int
  "Get shader attribute location.

C: int GetShaderLocationAttrib(Shader shader, const char *attribName)"
  (shader (:struct shader))
  (attrib-name :string))

(define-function ("SetShaderValue" set-shader-value) :void
  "Set shader uniform value.

C: void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType)"
  (shader (:struct shader))
  (loc-index :int)
  (value :pointer)
  (uniform-type (:enum shader-uniform-data-type)))

(define-function ("SetShaderValueV" set-shader-value-v) :void
  "Set shader uniform value vector.

C: void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count)"
  (shader (:struct shader))
  (loc-index :int)
  (value :pointer)
  (uniform-type (:enum shader-uniform-data-type))
  (count :int))

(define-function ("SetShaderValueMatrix" set-shader-value-matrix) :void
  "Set shader uniform value (matrix 4x4).

C: void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat)"
  (shader (:struct shader))
  (loc-index :int)
  (mat (:struct matrix)))

(define-function ("SetShaderValueTexture" set-shader-value-texture) :void
  "Set shader uniform value and bind the texture (sampler2d).

C: void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture)"
  (shader (:struct shader))
  (loc-index :int)
  (texture (:struct texture)))

(define-function ("UnloadShader" unload-shader) :void
  "Unload shader from GPU memory (VRAM).

C: void UnloadShader(Shader shader)"
  (shader (:struct shader)))

(define-function ("GetScreenToWorldRay" get-screen-to-world-ray) (:struct ray)
  "Get a ray trace from screen position (i.e mouse).

C: Ray GetScreenToWorldRay(Vector2 position, Camera camera)"
  (position (:struct vector2))
  (camera (:struct camera-3d)))

(define-function ("GetScreenToWorldRayEx" get-screen-to-world-ray-ex) (:struct ray)
  "Get a ray trace from screen position (i.e mouse) in a viewport.

C: Ray GetScreenToWorldRayEx(Vector2 position, Camera camera, int width, int height)"
  (position (:struct vector2))
  (camera (:struct camera-3d))
  (width :int)
  (height :int))

(define-function ("GetWorldToScreen" get-world-to-screen) (:struct vector2)
  "Get the screen space position for a 3d world space position.

C: Vector2 GetWorldToScreen(Vector3 position, Camera camera)"
  (position (:struct vector3))
  (camera (:struct camera-3d)))

(define-function ("GetWorldToScreenEx" get-world-to-screen-ex) (:struct vector2)
  "Get size position for a 3d world space position.

C: Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height)"
  (position (:struct vector3))
  (camera (:struct camera-3d))
  (width :int)
  (height :int))

(define-function ("GetWorldToScreen2D" get-world-to-screen-2d) (:struct vector2)
  "Get the screen space position for a 2d camera world space position.

C: Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera)"
  (position (:struct vector2))
  (camera (:struct camera-2d)))

(define-function ("GetScreenToWorld2D" get-screen-to-world-2d) (:struct vector2)
  "Get the world space position for a 2d camera screen space position.

C: Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera)"
  (position (:struct vector2))
  (camera (:struct camera-2d)))

(define-function ("GetCameraMatrix" get-camera-matrix) (:struct matrix)
  "Get camera transform matrix (view matrix).

C: Matrix GetCameraMatrix(Camera camera)"
  (camera (:struct camera-3d)))

(define-function ("GetCameraMatrix2D" get-camera-matrix-2d) (:struct matrix)
  "Get camera 2d transform matrix.

C: Matrix GetCameraMatrix2D(Camera2D camera)"
  (camera (:struct camera-2d)))

(define-function ("SetTargetFPS" set-target-fps) :void
  "Set target FPS (maximum).

C: void SetTargetFPS(int fps)"
  (fps :int))

(define-function ("GetFrameTime" get-frame-time) :float
  "Get time in seconds for last frame drawn (delta time).

C: float GetFrameTime()")

(define-function ("GetTime" get-time) :double
  "Get elapsed time in seconds since InitWindow().

C: double GetTime()")

(define-function ("GetFPS" get-fps) :int
  "Get current FPS.

C: int GetFPS()")

(define-function ("SwapScreenBuffer" swap-screen-buffer) :void
  "Swap back buffer with front buffer (screen drawing).

C: void SwapScreenBuffer()")

(define-function ("PollInputEvents" poll-input-events) :void
  "Register all input events.

C: void PollInputEvents()")

(define-function ("WaitTime" wait-time) :void
  "Wait for some time (halt program execution).

C: void WaitTime(double seconds)"
  (seconds :double))

(define-function ("SetRandomSeed" set-random-seed) :void
  "Set the seed for the random number generator.

C: void SetRandomSeed(unsigned int seed)"
  (seed :uint))

(define-function ("GetRandomValue" get-random-value) :int
  "Get a random value between min and max (both included).

C: int GetRandomValue(int min, int max)"
  (min :int)
  (max :int))

(define-function ("LoadRandomSequence" load-random-sequence) :pointer
  "Load random values sequence, no values repeated.

C: int * LoadRandomSequence(unsigned int count, int min, int max)"
  (count :uint)
  (min :int)
  (max :int))

(define-function ("UnloadRandomSequence" unload-random-sequence) :void
  "Unload random values sequence.

C: void UnloadRandomSequence(int *sequence)"
  (sequence :pointer))

(define-function ("TakeScreenshot" take-screenshot) :void
  "Takes a screenshot of current screen (filename extension defines format).

C: void TakeScreenshot(const char *fileName)"
  (file-name :string))

(define-function ("SetConfigFlags" set-config-flags) :void
  "Setup init configuration flags (view FLAGS).

C: void SetConfigFlags(unsigned int flags)"
  (flags (:enum config-flags :uint)))

(define-function ("OpenURL" open-url) :void
  "Open URL with default system browser (if available).

C: void OpenURL(const char *url)"
  (url :string))

(define-function ("SetTraceLogLevel" set-trace-log-level) :void
  "Set the current threshold (minimum) log level.

C: void SetTraceLogLevel(int logLevel)"
  (log-level (:enum trace-log-level)))

(define-function ("SetTraceLogCallback" set-trace-log-callback) :void
  "Set custom trace log.

C: void SetTraceLogCallback(TraceLogCallback callback)"
  (callback :pointer))

(define-function ("MemAlloc" mem-alloc) :pointer
  "Internal memory allocator.

C: void * MemAlloc(unsigned int size)"
  (size :uint))

(define-function ("MemRealloc" mem-realloc) :pointer
  "Internal memory reallocator.

C: void * MemRealloc(void *ptr, unsigned int size)"
  (ptr :pointer)
  (size :uint))

(define-function ("MemFree" mem-free) :void
  "Internal memory free.

C: void MemFree(void *ptr)"
  (ptr :pointer))

(define-function ("LoadFileData" load-file-data) :pointer
  "Load file data as byte array (read).

C: unsigned char * LoadFileData(const char *fileName, int *dataSize)"
  (file-name :string)
  (data-size :pointer))

(define-function ("UnloadFileData" unload-file-data) :void
  "Unload file data allocated by LoadFileData().

C: void UnloadFileData(unsigned char *data)"
  (data :pointer))

(define-function ("SaveFileData" save-file-data) :bool
  "Save data to file from byte array (write), returns true on success.

C: bool SaveFileData(const char *fileName, void *data, int dataSize)"
  (file-name :string)
  (data :pointer)
  (data-size :int))

(define-function ("ExportDataAsCode" export-data-as-code) :bool
  "Export data to code (.h), returns true on success.

C: bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName)"
  (data :pointer)
  (data-size :int)
  (file-name :string))

(define-function ("LoadFileText" load-file-text) :pointer
  "Load text data from file (read), returns a '\\0' terminated string.

C: char * LoadFileText(const char *fileName)"
  (file-name :string))

(define-function ("UnloadFileText" unload-file-text) :void
  "Unload file text data allocated by LoadFileText().

C: void UnloadFileText(char *text)"
  (text :pointer))

(define-function ("SaveFileText" save-file-text) :bool
  "Save text data to file (write), string must be '\\0' terminated, returns true on success.

C: bool SaveFileText(const char *fileName, const char *text)"
  (file-name :string)
  (text :string))

(define-function ("SetLoadFileDataCallback" set-load-file-data-callback) :void
  "Set custom file binary data loader.

C: void SetLoadFileDataCallback(LoadFileDataCallback callback)"
  (callback :pointer))

(define-function ("SetSaveFileDataCallback" set-save-file-data-callback) :void
  "Set custom file binary data saver.

C: void SetSaveFileDataCallback(SaveFileDataCallback callback)"
  (callback :pointer))

(define-function ("SetLoadFileTextCallback" set-load-file-text-callback) :void
  "Set custom file text data loader.

C: void SetLoadFileTextCallback(LoadFileTextCallback callback)"
  (callback :pointer))

(define-function ("SetSaveFileTextCallback" set-save-file-text-callback) :void
  "Set custom file text data saver.

C: void SetSaveFileTextCallback(SaveFileTextCallback callback)"
  (callback :pointer))

(define-function ("FileRename" file-rename) :int
  "Rename file (if exists).

C: int FileRename(const char *fileName, const char *fileRename)"
  (file-name :string)
  (file-rename :string))

(define-function ("FileRemove" file-remove) :int
  "Remove file (if exists).

C: int FileRemove(const char *fileName)"
  (file-name :string))

(define-function ("FileCopy" file-copy) :int
  "Copy file from one path to another, dstPath created if it doesn't exist.

C: int FileCopy(const char *srcPath, const char *dstPath)"
  (src-path :string)
  (dst-path :string))

(define-function ("FileMove" file-move) :int
  "Move file from one directory to another, dstPath created if it doesn't exist.

C: int FileMove(const char *srcPath, const char *dstPath)"
  (src-path :string)
  (dst-path :string))

(define-function ("FileTextReplace" file-text-replace) :int
  "Replace text in an existing file.

C: int FileTextReplace(const char *fileName, const char *search, const char *replacement)"
  (file-name :string)
  (search :string)
  (replacement :string))

(define-function ("FileTextFindIndex" file-text-find-index) :int
  "Find text in existing file.

C: int FileTextFindIndex(const char *fileName, const char *search)"
  (file-name :string)
  (search :string))

(define-function ("FileExists" file-exists) :bool
  "Check if file exists.

C: bool FileExists(const char *fileName)"
  (file-name :string))

(define-function ("DirectoryExists" directory-exists) :bool
  "Check if a directory path exists.

C: bool DirectoryExists(const char *dirPath)"
  (dir-path :string))

(define-function ("IsFileExtension" is-file-extension) :bool
  "Check file extension (recommended include point: .png, .wav).

C: bool IsFileExtension(const char *fileName, const char *ext)"
  (file-name :string)
  (ext :string))

(define-function ("GetFileLength" get-file-length) :int
  "Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h).

C: int GetFileLength(const char *fileName)"
  (file-name :string))

(define-function ("GetFileModTime" get-file-mod-time) :long
  "Get file modification time (last write time).

C: long GetFileModTime(const char *fileName)"
  (file-name :string))

(define-function ("GetFileExtension" get-file-extension) :string
  "Get pointer to extension for a filename string (includes dot: '.png').

C: const char * GetFileExtension(const char *fileName)"
  (file-name :string))

(define-function ("GetFileName" get-file-name) :string
  "Get pointer to filename for a path string.

C: const char * GetFileName(const char *filePath)"
  (file-path :string))

(define-function ("GetFileNameWithoutExt" get-file-name-without-ext) :string
  "Get filename string without extension (uses static string).

C: const char * GetFileNameWithoutExt(const char *filePath)"
  (file-path :string))

(define-function ("GetDirectoryPath" get-directory-path) :string
  "Get full path for a given fileName with path (uses static string).

C: const char * GetDirectoryPath(const char *filePath)"
  (file-path :string))

(define-function ("GetPrevDirectoryPath" get-prev-directory-path) :string
  "Get previous directory path for a given path (uses static string).

C: const char * GetPrevDirectoryPath(const char *dirPath)"
  (dir-path :string))

(define-function ("GetWorkingDirectory" get-working-directory) :string
  "Get current working directory (uses static string).

C: const char * GetWorkingDirectory()")

(define-function ("GetApplicationDirectory" get-application-directory) :string
  "Get the directory of the running application (uses static string).

C: const char * GetApplicationDirectory()")

(define-function ("MakeDirectory" make-directory) :int
  "Create directories (including full path requested), returns 0 on success.

C: int MakeDirectory(const char *dirPath)"
  (dir-path :string))

(define-function ("ChangeDirectory" change-directory) :bool
  "Change working directory, return true on success.

C: bool ChangeDirectory(const char *dirPath)"
  (dir-path :string))

(define-function ("IsPathFile" is-path-file) :bool
  "Check if a given path is a file or a directory.

C: bool IsPathFile(const char *path)"
  (path :string))

(define-function ("IsFileNameValid" is-file-name-valid) :bool
  "Check if fileName is valid for the platform/OS.

C: bool IsFileNameValid(const char *fileName)"
  (file-name :string))

(define-function ("LoadDirectoryFiles" load-directory-files) (:struct file-path-list)
  "Load directory filepaths, files and directories, no subdirs scan.

C: FilePathList LoadDirectoryFiles(const char *dirPath)"
  (dir-path :string))

(define-function ("LoadDirectoryFilesEx" load-directory-files-ex) (:struct file-path-list)
  "Load directory filepaths with extension filtering and subdir scan; some filters available: \"*.*\", \"FILES*\", \"DIRS*\".

C: FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs)"
  (base-path :string)
  (filter :string)
  (scan-subdirs :bool))

(define-function ("UnloadDirectoryFiles" unload-directory-files) :void
  "Unload filepaths.

C: void UnloadDirectoryFiles(FilePathList files)"
  (files (:struct file-path-list)))

(define-function ("IsFileDropped" is-file-dropped) :bool
  "Check if a file has been dropped into window.

C: bool IsFileDropped()")

(define-function ("LoadDroppedFiles" load-dropped-files) (:struct file-path-list)
  "Load dropped filepaths.

C: FilePathList LoadDroppedFiles()")

(define-function ("UnloadDroppedFiles" unload-dropped-files) :void
  "Unload dropped filepaths.

C: void UnloadDroppedFiles(FilePathList files)"
  (files (:struct file-path-list)))

(define-function ("GetDirectoryFileCount" get-directory-file-count) :uint
  "Get the file count in a directory.

C: unsigned int GetDirectoryFileCount(const char *dirPath)"
  (dir-path :string))

(define-function ("GetDirectoryFileCountEx" get-directory-file-count-ex) :uint
  "Get the file count in a directory with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result.

C: unsigned int GetDirectoryFileCountEx(const char *basePath, const char *filter, bool scanSubdirs)"
  (base-path :string)
  (filter :string)
  (scan-subdirs :bool))

(define-function ("CompressData" compress-data) :pointer
  "Compress data (DEFLATE algorithm), memory must be MemFree().

C: unsigned char * CompressData(const unsigned char *data, int dataSize, int *compDataSize)"
  (data :pointer)
  (data-size :int)
  (comp-data-size :pointer))

(define-function ("DecompressData" decompress-data) :pointer
  "Decompress data (DEFLATE algorithm), memory must be MemFree().

C: unsigned char * DecompressData(const unsigned char *compData, int compDataSize, int *dataSize)"
  (comp-data :pointer)
  (comp-data-size :int)
  (data-size :pointer))

(define-function ("EncodeDataBase64" encode-data-base64) :pointer
  "Encode data to Base64 string (includes NULL terminator), memory must be MemFree().

C: char * EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize)"
  (data :pointer)
  (data-size :int)
  (output-size :pointer))

(define-function ("DecodeDataBase64" decode-data-base64) :pointer
  "Decode Base64 string (expected NULL terminated), memory must be MemFree().

C: unsigned char * DecodeDataBase64(const char *text, int *outputSize)"
  (text :string)
  (output-size :pointer))

(define-function ("ComputeCRC32" compute-crc32) :uint
  "Compute CRC32 hash code.

C: unsigned int ComputeCRC32(unsigned char *data, int dataSize)"
  (data :pointer)
  (data-size :int))

(define-function ("ComputeMD5" compute-md5) :pointer
  "Compute MD5 hash code, returns static int[4] (16 bytes).

C: unsigned int * ComputeMD5(unsigned char *data, int dataSize)"
  (data :pointer)
  (data-size :int))

(define-function ("ComputeSHA1" compute-sha1) :pointer
  "Compute SHA1 hash code, returns static int[5] (20 bytes).

C: unsigned int * ComputeSHA1(unsigned char *data, int dataSize)"
  (data :pointer)
  (data-size :int))

(define-function ("ComputeSHA256" compute-sha256) :pointer
  "Compute SHA256 hash code, returns static int[8] (32 bytes).

C: unsigned int * ComputeSHA256(unsigned char *data, int dataSize)"
  (data :pointer)
  (data-size :int))

(define-function ("LoadAutomationEventList" load-automation-event-list) (:struct automation-event-list)
  "Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS.

C: AutomationEventList LoadAutomationEventList(const char *fileName)"
  (file-name :string))

(define-function ("UnloadAutomationEventList" unload-automation-event-list) :void
  "Unload automation events list from file.

C: void UnloadAutomationEventList(AutomationEventList list)"
  (list (:struct automation-event-list)))

(define-function ("ExportAutomationEventList" export-automation-event-list) :bool
  "Export automation events list as text file.

C: bool ExportAutomationEventList(AutomationEventList list, const char *fileName)"
  (list (:struct automation-event-list))
  (file-name :string))

(define-function ("SetAutomationEventList" set-automation-event-list) :void
  "Set automation event list to record to.

C: void SetAutomationEventList(AutomationEventList *list)"
  (list :pointer))

(define-function ("SetAutomationEventBaseFrame" set-automation-event-base-frame) :void
  "Set automation event internal base frame to start recording.

C: void SetAutomationEventBaseFrame(int frame)"
  (frame :int))

(define-function ("StartAutomationEventRecording" start-automation-event-recording) :void
  "Start recording automation events (AutomationEventList must be set).

C: void StartAutomationEventRecording()")

(define-function ("StopAutomationEventRecording" stop-automation-event-recording) :void
  "Stop recording automation events.

C: void StopAutomationEventRecording()")

(define-function ("PlayAutomationEvent" play-automation-event) :void
  "Play a recorded automation event.

C: void PlayAutomationEvent(AutomationEvent event)"
  (event (:struct automation-event)))

(define-function ("IsKeyPressed" is-key-pressed) :bool
  "Check if a key has been pressed once.

C: bool IsKeyPressed(int key)"
  (key (:enum keyboard-key)))

(define-function ("IsKeyPressedRepeat" is-key-pressed-repeat) :bool
  "Check if a key has been pressed again.

C: bool IsKeyPressedRepeat(int key)"
  (key (:enum keyboard-key)))

(define-function ("IsKeyDown" is-key-down) :bool
  "Check if a key is being pressed.

C: bool IsKeyDown(int key)"
  (key (:enum keyboard-key)))

(define-function ("IsKeyReleased" is-key-released) :bool
  "Check if a key has been released once.

C: bool IsKeyReleased(int key)"
  (key (:enum keyboard-key)))

(define-function ("IsKeyUp" is-key-up) :bool
  "Check if a key is NOT being pressed.

C: bool IsKeyUp(int key)"
  (key (:enum keyboard-key)))

(define-function ("GetKeyPressed" get-key-pressed) :int
  "Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty.

C: int GetKeyPressed()")

(define-function ("GetCharPressed" get-char-pressed) :int
  "Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty.

C: int GetCharPressed()")

(define-function ("GetKeyName" get-key-name) :string
  "Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard).

C: const char * GetKeyName(int key)"
  (key (:enum keyboard-key)))

(define-function ("SetExitKey" set-exit-key) :void
  "Set a custom key to exit program (default is ESC).

C: void SetExitKey(int key)"
  (key (:enum keyboard-key)))

(define-function ("IsGamepadAvailable" is-gamepad-available) :bool
  "Check if a gamepad is available.

C: bool IsGamepadAvailable(int gamepad)"
  (gamepad :int))

(define-function ("GetGamepadName" get-gamepad-name) :string
  "Get gamepad internal name id.

C: const char * GetGamepadName(int gamepad)"
  (gamepad :int))

(define-function ("IsGamepadButtonPressed" is-gamepad-button-pressed) :bool
  "Check if a gamepad button has been pressed once.

C: bool IsGamepadButtonPressed(int gamepad, int button)"
  (gamepad :int)
  (button (:enum gamepad-button)))

(define-function ("IsGamepadButtonDown" is-gamepad-button-down) :bool
  "Check if a gamepad button is being pressed.

C: bool IsGamepadButtonDown(int gamepad, int button)"
  (gamepad :int)
  (button (:enum gamepad-button)))

(define-function ("IsGamepadButtonReleased" is-gamepad-button-released) :bool
  "Check if a gamepad button has been released once.

C: bool IsGamepadButtonReleased(int gamepad, int button)"
  (gamepad :int)
  (button (:enum gamepad-button)))

(define-function ("IsGamepadButtonUp" is-gamepad-button-up) :bool
  "Check if a gamepad button is NOT being pressed.

C: bool IsGamepadButtonUp(int gamepad, int button)"
  (gamepad :int)
  (button (:enum gamepad-button)))

(define-function ("GetGamepadButtonPressed" get-gamepad-button-pressed) :int
  "Get the last gamepad button pressed.

C: int GetGamepadButtonPressed()")

(define-function ("GetGamepadAxisCount" get-gamepad-axis-count) :int
  "Get axis count for a gamepad.

C: int GetGamepadAxisCount(int gamepad)"
  (gamepad :int))

(define-function ("GetGamepadAxisMovement" get-gamepad-axis-movement) :float
  "Get movement value for a gamepad axis.

C: float GetGamepadAxisMovement(int gamepad, int axis)"
  (gamepad :int)
  (axis (:enum gamepad-axis)))

(define-function ("SetGamepadMappings" set-gamepad-mappings) :int
  "Set internal gamepad mappings (SDL_GameControllerDB).

C: int SetGamepadMappings(const char *mappings)"
  (mappings :string))

(define-function ("SetGamepadVibration" set-gamepad-vibration) :void
  "Set gamepad vibration for both motors (duration in seconds).

C: void SetGamepadVibration(int gamepad, float leftMotor, float rightMotor, float duration)"
  (gamepad :int)
  (left-motor :float)
  (right-motor :float)
  (duration :float))

(define-function ("IsMouseButtonPressed" is-mouse-button-pressed) :bool
  "Check if a mouse button has been pressed once.

C: bool IsMouseButtonPressed(int button)"
  (button (:enum mouse-button)))

(define-function ("IsMouseButtonDown" is-mouse-button-down) :bool
  "Check if a mouse button is being pressed.

C: bool IsMouseButtonDown(int button)"
  (button (:enum mouse-button)))

(define-function ("IsMouseButtonReleased" is-mouse-button-released) :bool
  "Check if a mouse button has been released once.

C: bool IsMouseButtonReleased(int button)"
  (button (:enum mouse-button)))

(define-function ("IsMouseButtonUp" is-mouse-button-up) :bool
  "Check if a mouse button is NOT being pressed.

C: bool IsMouseButtonUp(int button)"
  (button (:enum mouse-button)))

(define-function ("GetMouseX" get-mouse-x) :int
  "Get mouse position X.

C: int GetMouseX()")

(define-function ("GetMouseY" get-mouse-y) :int
  "Get mouse position Y.

C: int GetMouseY()")

(define-function ("GetMousePosition" get-mouse-position) (:struct vector2)
  "Get mouse position XY.

C: Vector2 GetMousePosition()")

(define-function ("GetMouseDelta" get-mouse-delta) (:struct vector2)
  "Get mouse delta between frames.

C: Vector2 GetMouseDelta()")

(define-function ("SetMousePosition" set-mouse-position) :void
  "Set mouse position XY.

C: void SetMousePosition(int x, int y)"
  (x :int)
  (y :int))

(define-function ("SetMouseOffset" set-mouse-offset) :void
  "Set mouse offset.

C: void SetMouseOffset(int offsetX, int offsetY)"
  (offset-x :int)
  (offset-y :int))

(define-function ("SetMouseScale" set-mouse-scale) :void
  "Set mouse scaling.

C: void SetMouseScale(float scaleX, float scaleY)"
  (scale-x :float)
  (scale-y :float))

(define-function ("GetMouseWheelMove" get-mouse-wheel-move) :float
  "Get mouse wheel movement for X or Y, whichever is larger.

C: float GetMouseWheelMove()")

(define-function ("GetMouseWheelMoveV" get-mouse-wheel-move-v) (:struct vector2)
  "Get mouse wheel movement for both X and Y.

C: Vector2 GetMouseWheelMoveV()")

(define-function ("SetMouseCursor" set-mouse-cursor) :void
  "Set mouse cursor.

C: void SetMouseCursor(int cursor)"
  (cursor (:enum mouse-cursor)))

(define-function ("GetTouchX" get-touch-x) :int
  "Get touch position X for touch point 0 (relative to screen size).

C: int GetTouchX()")

(define-function ("GetTouchY" get-touch-y) :int
  "Get touch position Y for touch point 0 (relative to screen size).

C: int GetTouchY()")

(define-function ("GetTouchPosition" get-touch-position) (:struct vector2)
  "Get touch position XY for a touch point index (relative to screen size).

C: Vector2 GetTouchPosition(int index)"
  (index :int))

(define-function ("GetTouchPointId" get-touch-point-id) :int
  "Get touch point identifier for given index.

C: int GetTouchPointId(int index)"
  (index :int))

(define-function ("GetTouchPointCount" get-touch-point-count) :int
  "Get number of touch points.

C: int GetTouchPointCount()")

(define-function ("SetGesturesEnabled" set-gestures-enabled) :void
  "Enable a set of gestures using flags.

C: void SetGesturesEnabled(unsigned int flags)"
  (flags (:enum gesture :uint)))

(define-function ("IsGestureDetected" is-gesture-detected) :bool
  "Check if a gesture have been detected.

C: bool IsGestureDetected(unsigned int gesture)"
  (gesture (:enum gesture :uint)))

(define-function ("GetGestureDetected" get-gesture-detected) :int
  "Get latest detected gesture.

C: int GetGestureDetected()")

(define-function ("GetGestureHoldDuration" get-gesture-hold-duration) :float
  "Get gesture hold time in seconds.

C: float GetGestureHoldDuration()")

(define-function ("GetGestureDragVector" get-gesture-drag-vector) (:struct vector2)
  "Get gesture drag vector.

C: Vector2 GetGestureDragVector()")

(define-function ("GetGestureDragAngle" get-gesture-drag-angle) :float
  "Get gesture drag angle.

C: float GetGestureDragAngle()")

(define-function ("GetGesturePinchVector" get-gesture-pinch-vector) (:struct vector2)
  "Get gesture pinch delta.

C: Vector2 GetGesturePinchVector()")

(define-function ("GetGesturePinchAngle" get-gesture-pinch-angle) :float
  "Get gesture pinch angle.

C: float GetGesturePinchAngle()")

(define-function ("UpdateCamera" update-camera) :void
  "Update camera position for selected mode.

C: void UpdateCamera(Camera *camera, int mode)"
  (camera (:inout camera-3d))
  (mode (:enum camera-mode)))

(define-function ("UpdateCameraPro" update-camera-pro) :void
  "Update camera movement/rotation.

C: void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom)"
  (camera (:inout camera-3d))
  (movement (:struct vector3))
  (rotation (:struct vector3))
  (zoom :float))

(define-function ("SetShapesTexture" set-shapes-texture) :void
  "Set texture and rectangle to be used on shapes drawing.

C: void SetShapesTexture(Texture2D texture, Rectangle source)"
  (texture (:struct texture))
  (source (:struct rectangle)))

(define-function ("GetShapesTexture" get-shapes-texture) (:struct texture)
  "Get texture that is used for shapes drawing.

C: Texture2D GetShapesTexture()")

(define-function ("GetShapesTextureRectangle" get-shapes-texture-rectangle) (:struct rectangle)
  "Get texture source rectangle that is used for shapes drawing.

C: Rectangle GetShapesTextureRectangle()")

(define-function ("DrawPixel" draw-pixel) :void
  "Draw a pixel using geometry [Can be slow, use with care].

C: void DrawPixel(int posX, int posY, Color color)"
  (pos-x :int)
  (pos-y :int)
  (color (:struct color)))

(define-function ("DrawPixelV" draw-pixel-v) :void
  "Draw a pixel using geometry (Vector version) [Can be slow, use with care].

C: void DrawPixelV(Vector2 position, Color color)"
  (position (:struct vector2))
  (color (:struct color)))

(define-function ("DrawLine" draw-line) :void
  "Draw a line.

C: void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color)"
  (start-pos-x :int)
  (start-pos-y :int)
  (end-pos-x :int)
  (end-pos-y :int)
  (color (:struct color)))

(define-function ("DrawLineV" draw-line-v) :void
  "Draw a line (using gl lines).

C: void DrawLineV(Vector2 startPos, Vector2 endPos, Color color)"
  (start-pos (:struct vector2))
  (end-pos (:struct vector2))
  (color (:struct color)))

(define-function ("DrawLineEx" draw-line-ex) :void
  "Draw a line (using triangles/quads).

C: void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color)"
  (start-pos (:struct vector2))
  (end-pos (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawLineStrip" draw-line-strip) :void
  "Draw lines sequence (using gl lines).

C: void DrawLineStrip(const Vector2 *points, int pointCount, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (color (:struct color)))

(define-function ("DrawLineBezier" draw-line-bezier) :void
  "Draw line segment cubic-bezier in-out interpolation.

C: void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color)"
  (start-pos (:struct vector2))
  (end-pos (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawLineDashed" draw-line-dashed) :void
  "Draw a dashed line.

C: void DrawLineDashed(Vector2 startPos, Vector2 endPos, int dashSize, int spaceSize, Color color)"
  (start-pos (:struct vector2))
  (end-pos (:struct vector2))
  (dash-size :int)
  (space-size :int)
  (color (:struct color)))

(define-function ("DrawCircle" draw-circle) :void
  "Draw a color-filled circle.

C: void DrawCircle(int centerX, int centerY, float radius, Color color)"
  (center-x :int)
  (center-y :int)
  (radius :float)
  (color (:struct color)))

(define-function ("DrawCircleV" draw-circle-v) :void
  "Draw a color-filled circle (Vector version).

C: void DrawCircleV(Vector2 center, float radius, Color color)"
  (center (:struct vector2))
  (radius :float)
  (color (:struct color)))

(define-function ("DrawCircleGradient" draw-circle-gradient) :void
  "Draw a gradient-filled circle.

C: void DrawCircleGradient(Vector2 center, float radius, Color inner, Color outer)"
  (center (:struct vector2))
  (radius :float)
  (inner (:struct color))
  (outer (:struct color)))

(define-function ("DrawCircleSector" draw-circle-sector) :void
  "Draw a piece of a circle.

C: void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)"
  (center (:struct vector2))
  (radius :float)
  (start-angle :float)
  (end-angle :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawCircleSectorLines" draw-circle-sector-lines) :void
  "Draw circle sector outline.

C: void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)"
  (center (:struct vector2))
  (radius :float)
  (start-angle :float)
  (end-angle :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawCircleLines" draw-circle-lines) :void
  "Draw circle outline.

C: void DrawCircleLines(int centerX, int centerY, float radius, Color color)"
  (center-x :int)
  (center-y :int)
  (radius :float)
  (color (:struct color)))

(define-function ("DrawCircleLinesV" draw-circle-lines-v) :void
  "Draw circle outline (Vector version).

C: void DrawCircleLinesV(Vector2 center, float radius, Color color)"
  (center (:struct vector2))
  (radius :float)
  (color (:struct color)))

(define-function ("DrawEllipse" draw-ellipse) :void
  "Draw ellipse.

C: void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color)"
  (center-x :int)
  (center-y :int)
  (radius-h :float)
  (radius-v :float)
  (color (:struct color)))

(define-function ("DrawEllipseV" draw-ellipse-v) :void
  "Draw ellipse (Vector version).

C: void DrawEllipseV(Vector2 center, float radiusH, float radiusV, Color color)"
  (center (:struct vector2))
  (radius-h :float)
  (radius-v :float)
  (color (:struct color)))

(define-function ("DrawEllipseLines" draw-ellipse-lines) :void
  "Draw ellipse outline.

C: void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color)"
  (center-x :int)
  (center-y :int)
  (radius-h :float)
  (radius-v :float)
  (color (:struct color)))

(define-function ("DrawEllipseLinesV" draw-ellipse-lines-v) :void
  "Draw ellipse outline (Vector version).

C: void DrawEllipseLinesV(Vector2 center, float radiusH, float radiusV, Color color)"
  (center (:struct vector2))
  (radius-h :float)
  (radius-v :float)
  (color (:struct color)))

(define-function ("DrawRing" draw-ring) :void
  "Draw ring.

C: void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)"
  (center (:struct vector2))
  (inner-radius :float)
  (outer-radius :float)
  (start-angle :float)
  (end-angle :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawRingLines" draw-ring-lines) :void
  "Draw ring outline.

C: void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)"
  (center (:struct vector2))
  (inner-radius :float)
  (outer-radius :float)
  (start-angle :float)
  (end-angle :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawRectangle" draw-rectangle) :void
  "Draw a color-filled rectangle.

C: void DrawRectangle(int posX, int posY, int width, int height, Color color)"
  (pos-x :int)
  (pos-y :int)
  (width :int)
  (height :int)
  (color (:struct color)))

(define-function ("DrawRectangleV" draw-rectangle-v) :void
  "Draw a color-filled rectangle (Vector version).

C: void DrawRectangleV(Vector2 position, Vector2 size, Color color)"
  (position (:struct vector2))
  (size (:struct vector2))
  (color (:struct color)))

(define-function ("DrawRectangleRec" draw-rectangle-rec) :void
  "Draw a color-filled rectangle.

C: void DrawRectangleRec(Rectangle rec, Color color)"
  (rec (:struct rectangle))
  (color (:struct color)))

(define-function ("DrawRectanglePro" draw-rectangle-pro) :void
  "Draw a color-filled rectangle with pro parameters.

C: void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color)"
  (rec (:struct rectangle))
  (origin (:struct vector2))
  (rotation :float)
  (color (:struct color)))

(define-function ("DrawRectangleGradientV" draw-rectangle-gradient-v) :void
  "Draw a vertical-gradient-filled rectangle.

C: void DrawRectangleGradientV(int posX, int posY, int width, int height, Color top, Color bottom)"
  (pos-x :int)
  (pos-y :int)
  (width :int)
  (height :int)
  (top (:struct color))
  (bottom (:struct color)))

(define-function ("DrawRectangleGradientH" draw-rectangle-gradient-h) :void
  "Draw a horizontal-gradient-filled rectangle.

C: void DrawRectangleGradientH(int posX, int posY, int width, int height, Color left, Color right)"
  (pos-x :int)
  (pos-y :int)
  (width :int)
  (height :int)
  (left (:struct color))
  (right (:struct color)))

(define-function ("DrawRectangleGradientEx" draw-rectangle-gradient-ex) :void
  "Draw a gradient-filled rectangle with custom vertex colors.

C: void DrawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color bottomRight, Color topRight)"
  (rec (:struct rectangle))
  (top-left (:struct color))
  (bottom-left (:struct color))
  (bottom-right (:struct color))
  (top-right (:struct color)))

(define-function ("DrawRectangleLines" draw-rectangle-lines) :void
  "Draw rectangle outline.

C: void DrawRectangleLines(int posX, int posY, int width, int height, Color color)"
  (pos-x :int)
  (pos-y :int)
  (width :int)
  (height :int)
  (color (:struct color)))

(define-function ("DrawRectangleLinesEx" draw-rectangle-lines-ex) :void
  "Draw rectangle outline with extended parameters.

C: void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color)"
  (rec (:struct rectangle))
  (line-thick :float)
  (color (:struct color)))

(define-function ("DrawRectangleRounded" draw-rectangle-rounded) :void
  "Draw rectangle with rounded edges.

C: void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color)"
  (rec (:struct rectangle))
  (roundness :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawRectangleRoundedLines" draw-rectangle-rounded-lines) :void
  "Draw rectangle lines with rounded edges.

C: void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, Color color)"
  (rec (:struct rectangle))
  (roundness :float)
  (segments :int)
  (color (:struct color)))

(define-function ("DrawRectangleRoundedLinesEx" draw-rectangle-rounded-lines-ex) :void
  "Draw rectangle with rounded edges outline.

C: void DrawRectangleRoundedLinesEx(Rectangle rec, float roundness, int segments, float lineThick, Color color)"
  (rec (:struct rectangle))
  (roundness :float)
  (segments :int)
  (line-thick :float)
  (color (:struct color)))

(define-function ("DrawTriangle" draw-triangle) :void
  "Draw a color-filled triangle (vertex in counter-clockwise order!).

C: void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)"
  (v1 (:struct vector2))
  (v2 (:struct vector2))
  (v3 (:struct vector2))
  (color (:struct color)))

(define-function ("DrawTriangleLines" draw-triangle-lines) :void
  "Draw triangle outline (vertex in counter-clockwise order!).

C: void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color)"
  (v1 (:struct vector2))
  (v2 (:struct vector2))
  (v3 (:struct vector2))
  (color (:struct color)))

(define-function ("DrawTriangleFan" draw-triangle-fan) :void
  "Draw a triangle fan defined by points (first vertex is the center).

C: void DrawTriangleFan(const Vector2 *points, int pointCount, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (color (:struct color)))

(define-function ("DrawTriangleStrip" draw-triangle-strip) :void
  "Draw a triangle strip defined by points.

C: void DrawTriangleStrip(const Vector2 *points, int pointCount, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (color (:struct color)))

(define-function ("DrawPoly" draw-poly) :void
  "Draw a regular polygon (Vector version).

C: void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color)"
  (center (:struct vector2))
  (sides :int)
  (radius :float)
  (rotation :float)
  (color (:struct color)))

(define-function ("DrawPolyLines" draw-poly-lines) :void
  "Draw a polygon outline of n sides.

C: void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color)"
  (center (:struct vector2))
  (sides :int)
  (radius :float)
  (rotation :float)
  (color (:struct color)))

(define-function ("DrawPolyLinesEx" draw-poly-lines-ex) :void
  "Draw a polygon outline of n sides with extended parameters.

C: void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color)"
  (center (:struct vector2))
  (sides :int)
  (radius :float)
  (rotation :float)
  (line-thick :float)
  (color (:struct color)))

(define-function ("DrawSplineLinear" draw-spline-linear) :void
  "Draw spline: Linear, minimum 2 points.

C: void DrawSplineLinear(const Vector2 *points, int pointCount, float thick, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineBasis" draw-spline-basis) :void
  "Draw spline: B-Spline, minimum 4 points.

C: void DrawSplineBasis(const Vector2 *points, int pointCount, float thick, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineCatmullRom" draw-spline-catmull-rom) :void
  "Draw spline: Catmull-Rom, minimum 4 points.

C: void DrawSplineCatmullRom(const Vector2 *points, int pointCount, float thick, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineBezierQuadratic" draw-spline-bezier-quadratic) :void
  "Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...].

C: void DrawSplineBezierQuadratic(const Vector2 *points, int pointCount, float thick, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineBezierCubic" draw-spline-bezier-cubic) :void
  "Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...].

C: void DrawSplineBezierCubic(const Vector2 *points, int pointCount, float thick, Color color)"
  (points (:array-of vector2))
  (point-count :int)
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineSegmentLinear" draw-spline-segment-linear) :void
  "Draw spline segment: Linear, 2 points.

C: void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color)"
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineSegmentBasis" draw-spline-segment-basis) :void
  "Draw spline segment: B-Spline, 4 points.

C: void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color)"
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (p3 (:struct vector2))
  (p4 (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineSegmentCatmullRom" draw-spline-segment-catmull-rom) :void
  "Draw spline segment: Catmull-Rom, 4 points.

C: void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color)"
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (p3 (:struct vector2))
  (p4 (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineSegmentBezierQuadratic" draw-spline-segment-bezier-quadratic) :void
  "Draw spline segment: Quadratic Bezier, 2 points, 1 control point.

C: void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color)"
  (p1 (:struct vector2))
  (c2 (:struct vector2))
  (p3 (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("DrawSplineSegmentBezierCubic" draw-spline-segment-bezier-cubic) :void
  "Draw spline segment: Cubic Bezier, 2 points, 2 control points.

C: void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color)"
  (p1 (:struct vector2))
  (c2 (:struct vector2))
  (c3 (:struct vector2))
  (p4 (:struct vector2))
  (thick :float)
  (color (:struct color)))

(define-function ("GetSplinePointLinear" get-spline-point-linear) (:struct vector2)
  "Get (evaluate) spline point: Linear.

C: Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t)"
  (start-pos (:struct vector2))
  (end-pos (:struct vector2))
  (t-value :float))

(define-function ("GetSplinePointBasis" get-spline-point-basis) (:struct vector2)
  "Get (evaluate) spline point: B-Spline.

C: Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)"
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (p3 (:struct vector2))
  (p4 (:struct vector2))
  (t-value :float))

(define-function ("GetSplinePointCatmullRom" get-spline-point-catmull-rom) (:struct vector2)
  "Get (evaluate) spline point: Catmull-Rom.

C: Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)"
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (p3 (:struct vector2))
  (p4 (:struct vector2))
  (t-value :float))

(define-function ("GetSplinePointBezierQuad" get-spline-point-bezier-quad) (:struct vector2)
  "Get (evaluate) spline point: Quadratic Bezier.

C: Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t)"
  (p1 (:struct vector2))
  (c2 (:struct vector2))
  (p3 (:struct vector2))
  (t-value :float))

(define-function ("GetSplinePointBezierCubic" get-spline-point-bezier-cubic) (:struct vector2)
  "Get (evaluate) spline point: Cubic Bezier.

C: Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t)"
  (p1 (:struct vector2))
  (c2 (:struct vector2))
  (c3 (:struct vector2))
  (p4 (:struct vector2))
  (t-value :float))

(define-function ("CheckCollisionRecs" check-collision-recs) :bool
  "Check collision between two rectangles.

C: bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2)"
  (rec1 (:struct rectangle))
  (rec2 (:struct rectangle)))

(define-function ("CheckCollisionCircles" check-collision-circles) :bool
  "Check collision between two circles.

C: bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2)"
  (center1 (:struct vector2))
  (radius1 :float)
  (center2 (:struct vector2))
  (radius2 :float))

(define-function ("CheckCollisionCircleRec" check-collision-circle-rec) :bool
  "Check collision between circle and rectangle.

C: bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec)"
  (center (:struct vector2))
  (radius :float)
  (rec (:struct rectangle)))

(define-function ("CheckCollisionCircleLine" check-collision-circle-line) :bool
  "Check if circle collides with a line created betweeen two points [p1] and [p2].

C: bool CheckCollisionCircleLine(Vector2 center, float radius, Vector2 p1, Vector2 p2)"
  (center (:struct vector2))
  (radius :float)
  (p1 (:struct vector2))
  (p2 (:struct vector2)))

(define-function ("CheckCollisionPointRec" check-collision-point-rec) :bool
  "Check if point is inside rectangle.

C: bool CheckCollisionPointRec(Vector2 point, Rectangle rec)"
  (point (:struct vector2))
  (rec (:struct rectangle)))

(define-function ("CheckCollisionPointCircle" check-collision-point-circle) :bool
  "Check if point is inside circle.

C: bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius)"
  (point (:struct vector2))
  (center (:struct vector2))
  (radius :float))

(define-function ("CheckCollisionPointTriangle" check-collision-point-triangle) :bool
  "Check if point is inside a triangle.

C: bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3)"
  (point (:struct vector2))
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (p3 (:struct vector2)))

(define-function ("CheckCollisionPointLine" check-collision-point-line) :bool
  "Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold].

C: bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold)"
  (point (:struct vector2))
  (p1 (:struct vector2))
  (p2 (:struct vector2))
  (threshold :int))

(define-function ("CheckCollisionPointPoly" check-collision-point-poly) :bool
  "Check if point is within a polygon described by array of vertices.

C: bool CheckCollisionPointPoly(Vector2 point, const Vector2 *points, int pointCount)"
  (point (:struct vector2))
  (points (:array-of vector2))
  (point-count :int))

(define-function ("CheckCollisionLines" check-collision-lines) :bool
  "Check the collision between two lines defined by two points each, returns collision point by reference.

C: bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint)"
  (start-pos1 (:struct vector2))
  (end-pos1 (:struct vector2))
  (start-pos2 (:struct vector2))
  (end-pos2 (:struct vector2))
  (collision-point (:inout vector2)))

(define-function ("GetCollisionRec" get-collision-rec) (:struct rectangle)
  "Get collision rectangle for two rectangles collision.

C: Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2)"
  (rec1 (:struct rectangle))
  (rec2 (:struct rectangle)))

(define-function ("LoadImage" load-image) (:struct image)
  "Load image from file into CPU memory (RAM).

C: Image LoadImage(const char *fileName)"
  (file-name :string))

(define-function ("LoadImageRaw" load-image-raw) (:struct image)
  "Load image from RAW file data.

C: Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize)"
  (file-name :string)
  (width :int)
  (height :int)
  (format (:enum pixel-format))
  (header-size :int))

(define-function ("LoadImageAnim" load-image-anim) (:struct image)
  "Load image sequence from file (frames appended to image.data).

C: Image LoadImageAnim(const char *fileName, int *frames)"
  (file-name :string)
  (frames :pointer))

(define-function ("LoadImageAnimFromMemory" load-image-anim-from-memory) (:struct image)
  "Load image sequence from memory buffer.

C: Image LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames)"
  (file-type :string)
  (file-data :pointer)
  (data-size :int)
  (frames :pointer))

(define-function ("LoadImageFromMemory" load-image-from-memory) (:struct image)
  "Load image from memory buffer, fileType refers to extension: i.e. '.png'.

C: Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)"
  (file-type :string)
  (file-data :pointer)
  (data-size :int))

(define-function ("LoadImageFromTexture" load-image-from-texture) (:struct image)
  "Load image from GPU texture data.

C: Image LoadImageFromTexture(Texture2D texture)"
  (texture (:struct texture)))

(define-function ("LoadImageFromScreen" load-image-from-screen) (:struct image)
  "Load image from screen buffer and (screenshot).

C: Image LoadImageFromScreen()")

(define-function ("IsImageValid" is-image-valid) :bool
  "Check if an image is valid (data and parameters).

C: bool IsImageValid(Image image)"
  (image (:struct image)))

(define-function ("UnloadImage" unload-image) :void
  "Unload image from CPU memory (RAM).

C: void UnloadImage(Image image)"
  (image (:struct image)))

(define-function ("ExportImage" export-image) :bool
  "Export image data to file, returns true on success.

C: bool ExportImage(Image image, const char *fileName)"
  (image (:struct image))
  (file-name :string))

(define-function ("ExportImageToMemory" export-image-to-memory) :pointer
  "Export image to memory buffer, memory must be MemFree().

C: unsigned char * ExportImageToMemory(Image image, const char *fileType, int *fileSize)"
  (image (:struct image))
  (file-type :string)
  (file-size :pointer))

(define-function ("ExportImageAsCode" export-image-as-code) :bool
  "Export image as code file defining an array of bytes, returns true on success.

C: bool ExportImageAsCode(Image image, const char *fileName)"
  (image (:struct image))
  (file-name :string))

(define-function ("GenImageColor" gen-image-color) (:struct image)
  "Generate image: plain color.

C: Image GenImageColor(int width, int height, Color color)"
  (width :int)
  (height :int)
  (color (:struct color)))

(define-function ("GenImageGradientLinear" gen-image-gradient-linear) (:struct image)
  "Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient.

C: Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end)"
  (width :int)
  (height :int)
  (direction :int)
  (start (:struct color))
  (end (:struct color)))

(define-function ("GenImageGradientRadial" gen-image-gradient-radial) (:struct image)
  "Generate image: radial gradient.

C: Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer)"
  (width :int)
  (height :int)
  (density :float)
  (inner (:struct color))
  (outer (:struct color)))

(define-function ("GenImageGradientSquare" gen-image-gradient-square) (:struct image)
  "Generate image: square gradient.

C: Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer)"
  (width :int)
  (height :int)
  (density :float)
  (inner (:struct color))
  (outer (:struct color)))

(define-function ("GenImageChecked" gen-image-checked) (:struct image)
  "Generate image: checked.

C: Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2)"
  (width :int)
  (height :int)
  (checks-x :int)
  (checks-y :int)
  (col1 (:struct color))
  (col2 (:struct color)))

(define-function ("GenImageWhiteNoise" gen-image-white-noise) (:struct image)
  "Generate image: white noise.

C: Image GenImageWhiteNoise(int width, int height, float factor)"
  (width :int)
  (height :int)
  (factor :float))

(define-function ("GenImagePerlinNoise" gen-image-perlin-noise) (:struct image)
  "Generate image: perlin noise.

C: Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale)"
  (width :int)
  (height :int)
  (offset-x :int)
  (offset-y :int)
  (scale :float))

(define-function ("GenImageCellular" gen-image-cellular) (:struct image)
  "Generate image: cellular algorithm, bigger tileSize means bigger cells.

C: Image GenImageCellular(int width, int height, int tileSize)"
  (width :int)
  (height :int)
  (tile-size :int))

(define-function ("GenImageText" gen-image-text) (:struct image)
  "Generate image: grayscale image from text data.

C: Image GenImageText(int width, int height, const char *text)"
  (width :int)
  (height :int)
  (text :string))

(define-function ("ImageCopy" image-copy) (:struct image)
  "Create an image duplicate (useful for transformations).

C: Image ImageCopy(Image image)"
  (image (:struct image)))

(define-function ("ImageFromImage" image-from-image) (:struct image)
  "Create an image from another image piece.

C: Image ImageFromImage(Image image, Rectangle rec)"
  (image (:struct image))
  (rec (:struct rectangle)))

(define-function ("ImageFromChannel" image-from-channel) (:struct image)
  "Create an image from a selected channel of another image (GRAYSCALE).

C: Image ImageFromChannel(Image image, int selectedChannel)"
  (image (:struct image))
  (selected-channel :int))

(define-function ("ImageText" image-text) (:struct image)
  "Create an image from text (default font).

C: Image ImageText(const char *text, int fontSize, Color color)"
  (text :string)
  (font-size :int)
  (color (:struct color)))

(define-function ("ImageTextEx" image-text-ex) (:struct image)
  "Create an image from text (custom sprite font).

C: Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint)"
  (font (:struct font))
  (text :string)
  (font-size :float)
  (spacing :float)
  (tint (:struct color)))

(define-function ("ImageFormat" image-format) :void
  "Convert image data to desired format.

C: void ImageFormat(Image *image, int newFormat)"
  (image (:inout image))
  (new-format (:enum pixel-format)))

(define-function ("ImageToPOT" image-to-pot) :void
  "Convert image to POT (power-of-two).

C: void ImageToPOT(Image *image, Color fill)"
  (image (:inout image))
  (fill (:struct color)))

(define-function ("ImageCrop" image-crop) :void
  "Crop an image to a defined rectangle.

C: void ImageCrop(Image *image, Rectangle crop)"
  (image (:inout image))
  (crop (:struct rectangle)))

(define-function ("ImageAlphaCrop" image-alpha-crop) :void
  "Crop image depending on alpha value.

C: void ImageAlphaCrop(Image *image, float threshold)"
  (image (:inout image))
  (threshold :float))

(define-function ("ImageAlphaClear" image-alpha-clear) :void
  "Clear alpha channel to desired color.

C: void ImageAlphaClear(Image *image, Color color, float threshold)"
  (image (:inout image))
  (color (:struct color))
  (threshold :float))

(define-function ("ImageAlphaMask" image-alpha-mask) :void
  "Apply alpha mask to image.

C: void ImageAlphaMask(Image *image, Image alphaMask)"
  (image (:inout image))
  (alpha-mask (:struct image)))

(define-function ("ImageAlphaPremultiply" image-alpha-premultiply) :void
  "Premultiply alpha channel.

C: void ImageAlphaPremultiply(Image *image)"
  (image (:inout image)))

(define-function ("ImageBlurGaussian" image-blur-gaussian) :void
  "Apply Gaussian blur using a box blur approximation.

C: void ImageBlurGaussian(Image *image, int blurSize)"
  (image (:inout image))
  (blur-size :int))

(define-function ("ImageKernelConvolution" image-kernel-convolution) :void
  "Apply custom square convolution kernel to image.

C: void ImageKernelConvolution(Image *image, const float *kernel, int kernelSize)"
  (image (:inout image))
  (kernel :pointer)
  (kernel-size :int))

(define-function ("ImageResize" image-resize) :void
  "Resize image (Bicubic scaling algorithm).

C: void ImageResize(Image *image, int newWidth, int newHeight)"
  (image (:inout image))
  (new-width :int)
  (new-height :int))

(define-function ("ImageResizeNN" image-resize-nn) :void
  "Resize image (Nearest-Neighbor scaling algorithm).

C: void ImageResizeNN(Image *image, int newWidth, int newHeight)"
  (image (:inout image))
  (new-width :int)
  (new-height :int))

(define-function ("ImageResizeCanvas" image-resize-canvas) :void
  "Resize canvas and fill with color.

C: void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill)"
  (image (:inout image))
  (new-width :int)
  (new-height :int)
  (offset-x :int)
  (offset-y :int)
  (fill (:struct color)))

(define-function ("ImageMipmaps" image-mipmaps) :void
  "Compute all mipmap levels for a provided image.

C: void ImageMipmaps(Image *image)"
  (image (:inout image)))

(define-function ("ImageDither" image-dither) :void
  "Dither image data to 16bpp or lower (Floyd-Steinberg dithering).

C: void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)"
  (image (:inout image))
  (r-bpp :int)
  (g-bpp :int)
  (b-bpp :int)
  (a-bpp :int))

(define-function ("ImageFlipVertical" image-flip-vertical) :void
  "Flip image vertically.

C: void ImageFlipVertical(Image *image)"
  (image (:inout image)))

(define-function ("ImageFlipHorizontal" image-flip-horizontal) :void
  "Flip image horizontally.

C: void ImageFlipHorizontal(Image *image)"
  (image (:inout image)))

(define-function ("ImageRotate" image-rotate) :void
  "Rotate image by input angle in degrees (-359 to 359).

C: void ImageRotate(Image *image, int degrees)"
  (image (:inout image))
  (degrees :int))

(define-function ("ImageRotateCW" image-rotate-cw) :void
  "Rotate image clockwise 90deg.

C: void ImageRotateCW(Image *image)"
  (image (:inout image)))

(define-function ("ImageRotateCCW" image-rotate-ccw) :void
  "Rotate image counter-clockwise 90deg.

C: void ImageRotateCCW(Image *image)"
  (image (:inout image)))

(define-function ("ImageColorTint" image-color-tint) :void
  "Modify image color: tint.

C: void ImageColorTint(Image *image, Color color)"
  (image (:inout image))
  (color (:struct color)))

(define-function ("ImageColorInvert" image-color-invert) :void
  "Modify image color: invert.

C: void ImageColorInvert(Image *image)"
  (image (:inout image)))

(define-function ("ImageColorGrayscale" image-color-grayscale) :void
  "Modify image color: grayscale.

C: void ImageColorGrayscale(Image *image)"
  (image (:inout image)))

(define-function ("ImageColorContrast" image-color-contrast) :void
  "Modify image color: contrast (-100 to 100).

C: void ImageColorContrast(Image *image, float contrast)"
  (image (:inout image))
  (contrast :float))

(define-function ("ImageColorBrightness" image-color-brightness) :void
  "Modify image color: brightness (-255 to 255).

C: void ImageColorBrightness(Image *image, int brightness)"
  (image (:inout image))
  (brightness :int))

(define-function ("ImageColorReplace" image-color-replace) :void
  "Modify image color: replace color.

C: void ImageColorReplace(Image *image, Color color, Color replace)"
  (image (:inout image))
  (color (:struct color))
  (replace (:struct color)))

(define-function ("LoadImageColors" load-image-colors) :pointer
  "Load color data from image as a Color array (RGBA - 32bit).

C: Color * LoadImageColors(Image image)"
  (image (:struct image)))

(define-function ("LoadImagePalette" load-image-palette) :pointer
  "Load colors palette from image as a Color array (RGBA - 32bit).

C: Color * LoadImagePalette(Image image, int maxPaletteSize, int *colorCount)"
  (image (:struct image))
  (max-palette-size :int)
  (color-count :pointer))

(define-function ("UnloadImageColors" unload-image-colors) :void
  "Unload color data loaded with LoadImageColors().

C: void UnloadImageColors(Color *colors)"
  (colors :pointer))

(define-function ("UnloadImagePalette" unload-image-palette) :void
  "Unload colors palette loaded with LoadImagePalette().

C: void UnloadImagePalette(Color *colors)"
  (colors :pointer))

(define-function ("GetImageAlphaBorder" get-image-alpha-border) (:struct rectangle)
  "Get image alpha border rectangle.

C: Rectangle GetImageAlphaBorder(Image image, float threshold)"
  (image (:struct image))
  (threshold :float))

(define-function ("GetImageColor" get-image-color) (:struct color)
  "Get image pixel color at (x, y) position.

C: Color GetImageColor(Image image, int x, int y)"
  (image (:struct image))
  (x :int)
  (y :int))

(define-function ("ImageClearBackground" image-clear-background) :void
  "Clear image background with given color.

C: void ImageClearBackground(Image *dst, Color color)"
  (dst (:inout image))
  (color (:struct color)))

(define-function ("ImageDrawPixel" image-draw-pixel) :void
  "Draw pixel within an image.

C: void ImageDrawPixel(Image *dst, int posX, int posY, Color color)"
  (dst (:inout image))
  (pos-x :int)
  (pos-y :int)
  (color (:struct color)))

(define-function ("ImageDrawPixelV" image-draw-pixel-v) :void
  "Draw pixel within an image (Vector version).

C: void ImageDrawPixelV(Image *dst, Vector2 position, Color color)"
  (dst (:inout image))
  (position (:struct vector2))
  (color (:struct color)))

(define-function ("ImageDrawLine" image-draw-line) :void
  "Draw line within an image.

C: void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color)"
  (dst (:inout image))
  (start-pos-x :int)
  (start-pos-y :int)
  (end-pos-x :int)
  (end-pos-y :int)
  (color (:struct color)))

(define-function ("ImageDrawLineV" image-draw-line-v) :void
  "Draw line within an image (Vector version).

C: void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color)"
  (dst (:inout image))
  (start (:struct vector2))
  (end (:struct vector2))
  (color (:struct color)))

(define-function ("ImageDrawLineEx" image-draw-line-ex) :void
  "Draw a line defining thickness within an image.

C: void ImageDrawLineEx(Image *dst, Vector2 start, Vector2 end, int thick, Color color)"
  (dst (:inout image))
  (start (:struct vector2))
  (end (:struct vector2))
  (thick :int)
  (color (:struct color)))

(define-function ("ImageDrawCircle" image-draw-circle) :void
  "Draw a filled circle within an image.

C: void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color)"
  (dst (:inout image))
  (center-x :int)
  (center-y :int)
  (radius :int)
  (color (:struct color)))

(define-function ("ImageDrawCircleV" image-draw-circle-v) :void
  "Draw a filled circle within an image (Vector version).

C: void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color)"
  (dst (:inout image))
  (center (:struct vector2))
  (radius :int)
  (color (:struct color)))

(define-function ("ImageDrawCircleLines" image-draw-circle-lines) :void
  "Draw circle outline within an image.

C: void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color)"
  (dst (:inout image))
  (center-x :int)
  (center-y :int)
  (radius :int)
  (color (:struct color)))

(define-function ("ImageDrawCircleLinesV" image-draw-circle-lines-v) :void
  "Draw circle outline within an image (Vector version).

C: void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color)"
  (dst (:inout image))
  (center (:struct vector2))
  (radius :int)
  (color (:struct color)))

(define-function ("ImageDrawRectangle" image-draw-rectangle) :void
  "Draw rectangle within an image.

C: void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color)"
  (dst (:inout image))
  (pos-x :int)
  (pos-y :int)
  (width :int)
  (height :int)
  (color (:struct color)))

(define-function ("ImageDrawRectangleV" image-draw-rectangle-v) :void
  "Draw rectangle within an image (Vector version).

C: void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color)"
  (dst (:inout image))
  (position (:struct vector2))
  (size (:struct vector2))
  (color (:struct color)))

(define-function ("ImageDrawRectangleRec" image-draw-rectangle-rec) :void
  "Draw rectangle within an image.

C: void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color)"
  (dst (:inout image))
  (rec (:struct rectangle))
  (color (:struct color)))

(define-function ("ImageDrawRectangleLines" image-draw-rectangle-lines) :void
  "Draw rectangle lines within an image.

C: void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color)"
  (dst (:inout image))
  (rec (:struct rectangle))
  (thick :int)
  (color (:struct color)))

(define-function ("ImageDrawTriangle" image-draw-triangle) :void
  "Draw triangle within an image.

C: void ImageDrawTriangle(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color)"
  (dst (:inout image))
  (v1 (:struct vector2))
  (v2 (:struct vector2))
  (v3 (:struct vector2))
  (color (:struct color)))

(define-function ("ImageDrawTriangleEx" image-draw-triangle-ex) :void
  "Draw triangle with interpolated colors within an image.

C: void ImageDrawTriangleEx(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3)"
  (dst (:inout image))
  (v1 (:struct vector2))
  (v2 (:struct vector2))
  (v3 (:struct vector2))
  (c1 (:struct color))
  (c2 (:struct color))
  (c3 (:struct color)))

(define-function ("ImageDrawTriangleLines" image-draw-triangle-lines) :void
  "Draw triangle outline within an image.

C: void ImageDrawTriangleLines(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color)"
  (dst (:inout image))
  (v1 (:struct vector2))
  (v2 (:struct vector2))
  (v3 (:struct vector2))
  (color (:struct color)))

(define-function ("ImageDrawTriangleFan" image-draw-triangle-fan) :void
  "Draw a triangle fan defined by points within an image (first vertex is the center).

C: void ImageDrawTriangleFan(Image *dst, const Vector2 *points, int pointCount, Color color)"
  (dst (:inout image))
  (points (:array-of vector2))
  (point-count :int)
  (color (:struct color)))

(define-function ("ImageDrawTriangleStrip" image-draw-triangle-strip) :void
  "Draw a triangle strip defined by points within an image.

C: void ImageDrawTriangleStrip(Image *dst, const Vector2 *points, int pointCount, Color color)"
  (dst (:inout image))
  (points (:array-of vector2))
  (point-count :int)
  (color (:struct color)))

(define-function ("ImageDraw" image-draw) :void
  "Draw a source image within a destination image (tint applied to source).

C: void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint)"
  (dst (:inout image))
  (src (:struct image))
  (src-rec (:struct rectangle))
  (dst-rec (:struct rectangle))
  (tint (:struct color)))

(define-function ("ImageDrawText" image-draw-text) :void
  "Draw text (using default font) within an image (destination).

C: void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color)"
  (dst (:inout image))
  (text :string)
  (pos-x :int)
  (pos-y :int)
  (font-size :int)
  (color (:struct color)))

(define-function ("ImageDrawTextEx" image-draw-text-ex) :void
  "Draw text (custom sprite font) within an image (destination).

C: void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)"
  (dst (:inout image))
  (font (:struct font))
  (text :string)
  (position (:struct vector2))
  (font-size :float)
  (spacing :float)
  (tint (:struct color)))

(define-function ("LoadTexture" load-texture) (:struct texture)
  "Load texture from file into GPU memory (VRAM).

C: Texture2D LoadTexture(const char *fileName)"
  (file-name :string))

(define-function ("LoadTextureFromImage" load-texture-from-image) (:struct texture)
  "Load texture from image data.

C: Texture2D LoadTextureFromImage(Image image)"
  (image (:struct image)))

(define-function ("LoadTextureCubemap" load-texture-cubemap) (:struct texture)
  "Load cubemap from image, multiple image cubemap layouts supported.

C: TextureCubemap LoadTextureCubemap(Image image, int layout)"
  (image (:struct image))
  (layout (:enum cubemap-layout)))

(define-function ("LoadRenderTexture" load-render-texture) (:struct render-texture)
  "Load texture for rendering (framebuffer).

C: RenderTexture2D LoadRenderTexture(int width, int height)"
  (width :int)
  (height :int))

(define-function ("IsTextureValid" is-texture-valid) :bool
  "Check if a texture is valid (loaded in GPU).

C: bool IsTextureValid(Texture2D texture)"
  (texture (:struct texture)))

(define-function ("UnloadTexture" unload-texture) :void
  "Unload texture from GPU memory (VRAM).

C: void UnloadTexture(Texture2D texture)"
  (texture (:struct texture)))

(define-function ("IsRenderTextureValid" is-render-texture-valid) :bool
  "Check if a render texture is valid (loaded in GPU).

C: bool IsRenderTextureValid(RenderTexture2D target)"
  (target (:struct render-texture)))

(define-function ("UnloadRenderTexture" unload-render-texture) :void
  "Unload render texture from GPU memory (VRAM).

C: void UnloadRenderTexture(RenderTexture2D target)"
  (target (:struct render-texture)))

(define-function ("UpdateTexture" update-texture) :void
  "Update GPU texture with new data (pixels should be able to fill texture).

C: void UpdateTexture(Texture2D texture, const void *pixels)"
  (texture (:struct texture))
  (pixels :pointer))

(define-function ("UpdateTextureRec" update-texture-rec) :void
  "Update GPU texture rectangle with new data (pixels and rec should fit in texture).

C: void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels)"
  (texture (:struct texture))
  (rec (:struct rectangle))
  (pixels :pointer))

(define-function ("GenTextureMipmaps" gen-texture-mipmaps) :void
  "Generate GPU mipmaps for a texture.

C: void GenTextureMipmaps(Texture2D *texture)"
  (texture (:inout texture)))

(define-function ("SetTextureFilter" set-texture-filter) :void
  "Set texture scaling filter mode.

C: void SetTextureFilter(Texture2D texture, int filter)"
  (texture (:struct texture))
  (filter (:enum texture-filter)))

(define-function ("SetTextureWrap" set-texture-wrap) :void
  "Set texture wrapping mode.

C: void SetTextureWrap(Texture2D texture, int wrap)"
  (texture (:struct texture))
  (wrap (:enum texture-wrap)))

(define-function ("DrawTexture" draw-texture) :void
  "Draw a Texture2D.

C: void DrawTexture(Texture2D texture, int posX, int posY, Color tint)"
  (texture (:struct texture))
  (pos-x :int)
  (pos-y :int)
  (tint (:struct color)))

(define-function ("DrawTextureV" draw-texture-v) :void
  "Draw a Texture2D with position defined as Vector2.

C: void DrawTextureV(Texture2D texture, Vector2 position, Color tint)"
  (texture (:struct texture))
  (position (:struct vector2))
  (tint (:struct color)))

(define-function ("DrawTextureEx" draw-texture-ex) :void
  "Draw a Texture2D with extended parameters.

C: void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint)"
  (texture (:struct texture))
  (position (:struct vector2))
  (rotation :float)
  (scale :float)
  (tint (:struct color)))

(define-function ("DrawTextureRec" draw-texture-rec) :void
  "Draw a part of a texture defined by a rectangle.

C: void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint)"
  (texture (:struct texture))
  (source (:struct rectangle))
  (position (:struct vector2))
  (tint (:struct color)))

(define-function ("DrawTexturePro" draw-texture-pro) :void
  "Draw a part of a texture defined by a rectangle with 'pro' parameters.

C: void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint)"
  (texture (:struct texture))
  (source (:struct rectangle))
  (dest (:struct rectangle))
  (origin (:struct vector2))
  (rotation :float)
  (tint (:struct color)))

(define-function ("DrawTextureNPatch" draw-texture-n-patch) :void
  "Draws a texture (or part of it) that stretches or shrinks nicely.

C: void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint)"
  (texture (:struct texture))
  (n-patch-info (:struct n-patch-info))
  (dest (:struct rectangle))
  (origin (:struct vector2))
  (rotation :float)
  (tint (:struct color)))

(define-function ("ColorIsEqual" color-is-equal) :bool
  "Check if two colors are equal.

C: bool ColorIsEqual(Color col1, Color col2)"
  (col1 (:struct color))
  (col2 (:struct color)))

(define-function ("Fade" fade) (:struct color)
  "Get color with alpha applied, alpha goes from 0.0f to 1.0f.

C: Color Fade(Color color, float alpha)"
  (color (:struct color))
  (alpha :float))

(define-function ("ColorToInt" color-to-int) :int
  "Get hexadecimal value for a Color (0xRRGGBBAA).

C: int ColorToInt(Color color)"
  (color (:struct color)))

(define-function ("ColorNormalize" color-normalize) (:struct vector4)
  "Get Color normalized as float [0..1].

C: Vector4 ColorNormalize(Color color)"
  (color (:struct color)))

(define-function ("ColorFromNormalized" color-from-normalized) (:struct color)
  "Get Color from normalized values [0..1].

C: Color ColorFromNormalized(Vector4 normalized)"
  (normalized (:struct vector4)))

(define-function ("ColorToHSV" color-to-hsv) (:struct vector3)
  "Get HSV values for a Color, hue [0..360], saturation/value [0..1].

C: Vector3 ColorToHSV(Color color)"
  (color (:struct color)))

(define-function ("ColorFromHSV" color-from-hsv) (:struct color)
  "Get a Color from HSV values, hue [0..360], saturation/value [0..1].

C: Color ColorFromHSV(float hue, float saturation, float value)"
  (hue :float)
  (saturation :float)
  (value :float))

(define-function ("ColorTint" color-tint) (:struct color)
  "Get color multiplied with another color.

C: Color ColorTint(Color color, Color tint)"
  (color (:struct color))
  (tint (:struct color)))

(define-function ("ColorBrightness" color-brightness) (:struct color)
  "Get color with brightness correction, brightness factor goes from -1.0f to 1.0f.

C: Color ColorBrightness(Color color, float factor)"
  (color (:struct color))
  (factor :float))

(define-function ("ColorContrast" color-contrast) (:struct color)
  "Get color with contrast correction, contrast values between -1.0f and 1.0f.

C: Color ColorContrast(Color color, float contrast)"
  (color (:struct color))
  (contrast :float))

(define-function ("ColorAlpha" color-alpha) (:struct color)
  "Get color with alpha applied, alpha goes from 0.0f to 1.0f.

C: Color ColorAlpha(Color color, float alpha)"
  (color (:struct color))
  (alpha :float))

(define-function ("ColorAlphaBlend" color-alpha-blend) (:struct color)
  "Get src alpha-blended into dst color with tint.

C: Color ColorAlphaBlend(Color dst, Color src, Color tint)"
  (dst (:struct color))
  (src (:struct color))
  (tint (:struct color)))

(define-function ("ColorLerp" color-lerp) (:struct color)
  "Get color lerp interpolation between two colors, factor [0.0f..1.0f].

C: Color ColorLerp(Color color1, Color color2, float factor)"
  (color1 (:struct color))
  (color2 (:struct color))
  (factor :float))

(define-function ("GetColor" get-color) (:struct color)
  "Get Color structure from hexadecimal value.

C: Color GetColor(unsigned int hexValue)"
  (hex-value :uint))

(define-function ("GetPixelColor" get-pixel-color) (:struct color)
  "Get Color from a source pixel pointer of certain format.

C: Color GetPixelColor(void *srcPtr, int format)"
  (src-ptr :pointer)
  (format (:enum pixel-format)))

(define-function ("SetPixelColor" set-pixel-color) :void
  "Set color formatted into destination pixel pointer.

C: void SetPixelColor(void *dstPtr, Color color, int format)"
  (dst-ptr :pointer)
  (color (:struct color))
  (format (:enum pixel-format)))

(define-function ("GetPixelDataSize" get-pixel-data-size) :int
  "Get pixel data size in bytes for certain format.

C: int GetPixelDataSize(int width, int height, int format)"
  (width :int)
  (height :int)
  (format (:enum pixel-format)))

(define-function ("GetFontDefault" get-font-default) (:struct font)
  "Get the default Font.

C: Font GetFontDefault()")

(define-function ("LoadFont" load-font) (:struct font)
  "Load font from file into GPU memory (VRAM).

C: Font LoadFont(const char *fileName)"
  (file-name :string))

(define-function ("LoadFontEx" load-font-ex) (:struct font)
  "Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height.

C: Font LoadFontEx(const char *fileName, int fontSize, const int *codepoints, int codepointCount)"
  (file-name :string)
  (font-size :int)
  (codepoints :pointer)
  (codepoint-count :int))

(define-function ("LoadFontFromImage" load-font-from-image) (:struct font)
  "Load font from Image (XNA style).

C: Font LoadFontFromImage(Image image, Color key, int firstChar)"
  (image (:struct image))
  (key (:struct color))
  (first-char :int))

(define-function ("LoadFontFromMemory" load-font-from-memory) (:struct font)
  "Load font from memory buffer, fileType refers to extension: i.e. '.ttf'.

C: Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, const int *codepoints, int codepointCount)"
  (file-type :string)
  (file-data :pointer)
  (data-size :int)
  (font-size :int)
  (codepoints :pointer)
  (codepoint-count :int))

(define-function ("IsFontValid" is-font-valid) :bool
  "Check if a font is valid (font data loaded, WARNING: GPU texture not checked).

C: bool IsFontValid(Font font)"
  (font (:struct font)))

(define-function ("LoadFontData" load-font-data) :pointer
  "Load font data for further use.

C: GlyphInfo * LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, const int *codepoints, int codepointCount, int type, int *glyphCount)"
  (file-data :pointer)
  (data-size :int)
  (font-size :int)
  (codepoints :pointer)
  (codepoint-count :int)
  (type (:enum font-type))
  (glyph-count :pointer))

(define-function ("GenImageFontAtlas" gen-image-font-atlas) (:struct image)
  "Generate image font atlas using chars info.

C: Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod)"
  (glyphs (:array-of glyph-info))
  (glyph-recs :pointer)
  (glyph-count :int)
  (font-size :int)
  (padding :int)
  (pack-method :int))

(define-function ("UnloadFontData" unload-font-data) :void
  "Unload font chars info data (RAM).

C: void UnloadFontData(GlyphInfo *glyphs, int glyphCount)"
  (glyphs :pointer)
  (glyph-count :int))

(define-function ("UnloadFont" unload-font) :void
  "Unload font from GPU memory (VRAM).

C: void UnloadFont(Font font)"
  (font (:struct font)))

(define-function ("ExportFontAsCode" export-font-as-code) :bool
  "Export font as code file, returns true on success.

C: bool ExportFontAsCode(Font font, const char *fileName)"
  (font (:struct font))
  (file-name :string))

(define-function ("DrawFPS" draw-fps) :void
  "Draw current FPS.

C: void DrawFPS(int posX, int posY)"
  (pos-x :int)
  (pos-y :int))

(define-function ("DrawText" draw-text) :void
  "Draw text (using default font).

C: void DrawText(const char *text, int posX, int posY, int fontSize, Color color)"
  (text :string)
  (pos-x :int)
  (pos-y :int)
  (font-size :int)
  (color (:struct color)))

(define-function ("DrawTextEx" draw-text-ex) :void
  "Draw text using font and additional parameters.

C: void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)"
  (font (:struct font))
  (text :string)
  (position (:struct vector2))
  (font-size :float)
  (spacing :float)
  (tint (:struct color)))

(define-function ("DrawTextPro" draw-text-pro) :void
  "Draw text using Font and pro parameters (rotation).

C: void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint)"
  (font (:struct font))
  (text :string)
  (position (:struct vector2))
  (origin (:struct vector2))
  (rotation :float)
  (font-size :float)
  (spacing :float)
  (tint (:struct color)))

(define-function ("DrawTextCodepoint" draw-text-codepoint) :void
  "Draw one character (codepoint).

C: void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint)"
  (font (:struct font))
  (codepoint :int)
  (position (:struct vector2))
  (font-size :float)
  (tint (:struct color)))

(define-function ("DrawTextCodepoints" draw-text-codepoints) :void
  "Draw multiple character (codepoint).

C: void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint)"
  (font (:struct font))
  (codepoints :pointer)
  (codepoint-count :int)
  (position (:struct vector2))
  (font-size :float)
  (spacing :float)
  (tint (:struct color)))

(define-function ("SetTextLineSpacing" set-text-line-spacing) :void
  "Set vertical line spacing when drawing with line-breaks.

C: void SetTextLineSpacing(int spacing)"
  (spacing :int))

(define-function ("MeasureText" measure-text) :int
  "Measure string width for default font.

C: int MeasureText(const char *text, int fontSize)"
  (text :string)
  (font-size :int))

(define-function ("MeasureTextEx" measure-text-ex) (:struct vector2)
  "Measure string size for Font.

C: Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing)"
  (font (:struct font))
  (text :string)
  (font-size :float)
  (spacing :float))

(define-function ("MeasureTextCodepoints" measure-text-codepoints) (:struct vector2)
  "Measure string size for an existing array of codepoints for Font.

C: Vector2 MeasureTextCodepoints(Font font, const int *codepoints, int length, float fontSize, float spacing)"
  (font (:struct font))
  (codepoints :pointer)
  (length :int)
  (font-size :float)
  (spacing :float))

(define-function ("GetGlyphIndex" get-glyph-index) :int
  "Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found.

C: int GetGlyphIndex(Font font, int codepoint)"
  (font (:struct font))
  (codepoint :int))

(define-function ("GetGlyphInfo" get-glyph-info) (:struct glyph-info)
  "Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found.

C: GlyphInfo GetGlyphInfo(Font font, int codepoint)"
  (font (:struct font))
  (codepoint :int))

(define-function ("GetGlyphAtlasRec" get-glyph-atlas-rec) (:struct rectangle)
  "Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found.

C: Rectangle GetGlyphAtlasRec(Font font, int codepoint)"
  (font (:struct font))
  (codepoint :int))

(define-function ("LoadUTF8" load-utf8) :pointer
  "Load UTF-8 text encoded from codepoints array.

C: char * LoadUTF8(const int *codepoints, int length)"
  (codepoints :pointer)
  (length :int))

(define-function ("UnloadUTF8" unload-utf8) :void
  "Unload UTF-8 text encoded from codepoints array.

C: void UnloadUTF8(char *text)"
  (text :pointer))

(define-function ("LoadCodepoints" load-codepoints) :pointer
  "Load all codepoints from a UTF-8 text string, codepoints count returned by parameter.

C: int * LoadCodepoints(const char *text, int *count)"
  (text :string)
  (count :pointer))

(define-function ("UnloadCodepoints" unload-codepoints) :void
  "Unload codepoints data from memory.

C: void UnloadCodepoints(int *codepoints)"
  (codepoints :pointer))

(define-function ("GetCodepointCount" get-codepoint-count) :int
  "Get total number of codepoints in a UTF-8 encoded string.

C: int GetCodepointCount(const char *text)"
  (text :string))

(define-function ("GetCodepoint" get-codepoint) :int
  "Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure.

C: int GetCodepoint(const char *text, int *codepointSize)"
  (text :string)
  (codepoint-size :pointer))

(define-function ("GetCodepointNext" get-codepoint-next) :int
  "Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure.

C: int GetCodepointNext(const char *text, int *codepointSize)"
  (text :string)
  (codepoint-size :pointer))

(define-function ("GetCodepointPrevious" get-codepoint-previous) :int
  "Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure.

C: int GetCodepointPrevious(const char *text, int *codepointSize)"
  (text :string)
  (codepoint-size :pointer))

(define-function ("CodepointToUTF8" codepoint-to-utf8) :string
  "Encode one codepoint into UTF-8 byte array (array length returned as parameter).

C: const char * CodepointToUTF8(int codepoint, int *utf8Size)"
  (codepoint :int)
  (utf8-size :pointer))

(define-function ("LoadTextLines" load-text-lines) :pointer
  "Load text as separate lines ('\\n').

C: char ** LoadTextLines(const char *text, int *count)"
  (text :string)
  (count :pointer))

(define-function ("UnloadTextLines" unload-text-lines) :void
  "Unload text lines.

C: void UnloadTextLines(char **text, int lineCount)"
  (text :pointer)
  (line-count :int))

(define-function ("TextCopy" text-copy) :int
  "Copy one string to another, returns bytes copied.

C: int TextCopy(char *dst, const char *src)"
  (dst :pointer)
  (src :string))

(define-function ("TextIsEqual" text-is-equal) :bool
  "Check if two text string are equal.

C: bool TextIsEqual(const char *text1, const char *text2)"
  (text1 :string)
  (text2 :string))

(define-function ("TextLength" text-length) :uint
  "Get text length, checks for '\\0' ending.

C: unsigned int TextLength(const char *text)"
  (text :string))

(define-function ("TextSubtext" text-subtext) :string
  "Get a piece of a text string.

C: const char * TextSubtext(const char *text, int position, int length)"
  (text :string)
  (position :int)
  (length :int))

(define-function ("TextRemoveSpaces" text-remove-spaces) :string
  "Remove text spaces, concat words.

C: const char * TextRemoveSpaces(const char *text)"
  (text :string))

(define-function ("GetTextBetween" get-text-between) :string
  "Get text between two strings.

C: char * GetTextBetween(const char *text, const char *begin, const char *end)"
  (text :string)
  (begin :string)
  (end :string))

(define-function ("TextReplace" text-replace) :string
  "Replace text string with new string.

C: char * TextReplace(const char *text, const char *search, const char *replacement)"
  (text :string)
  (search :string)
  (replacement :string))

(define-function ("TextReplaceAlloc" text-replace-alloc) :pointer
  "Replace text string with new string, memory must be MemFree().

C: char * TextReplaceAlloc(const char *text, const char *search, const char *replacement)"
  (text :string)
  (search :string)
  (replacement :string))

(define-function ("TextReplaceBetween" text-replace-between) :string
  "Replace text between two specific strings.

C: char * TextReplaceBetween(const char *text, const char *begin, const char *end, const char *replacement)"
  (text :string)
  (begin :string)
  (end :string)
  (replacement :string))

(define-function ("TextReplaceBetweenAlloc" text-replace-between-alloc) :pointer
  "Replace text between two specific strings, memory must be MemFree().

C: char * TextReplaceBetweenAlloc(const char *text, const char *begin, const char *end, const char *replacement)"
  (text :string)
  (begin :string)
  (end :string)
  (replacement :string))

(define-function ("TextInsert" text-insert) :string
  "Insert text in a defined byte position.

C: char * TextInsert(const char *text, const char *insert, int position)"
  (text :string)
  (insert :string)
  (position :int))

(define-function ("TextInsertAlloc" text-insert-alloc) :pointer
  "Insert text in a defined byte position, memory must be MemFree().

C: char * TextInsertAlloc(const char *text, const char *insert, int position)"
  (text :string)
  (insert :string)
  (position :int))

(define-function ("TextJoin" text-join) :string
  "Join text strings with delimiter.

C: char * TextJoin(char **textList, int count, const char *delimiter)"
  (text-list :pointer)
  (count :int)
  (delimiter :string))

(define-function ("TextSplit" text-split) :pointer
  "Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings.

C: char ** TextSplit(const char *text, char delimiter, int *count)"
  (text :string)
  (delimiter :char)
  (count :pointer))

(define-function ("TextAppend" text-append) :void
  "Append text at specific position and move cursor.

C: void TextAppend(char *text, const char *append, int *position)"
  (text :pointer)
  (append :string)
  (position :pointer))

(define-function ("TextFindIndex" text-find-index) :int
  "Find first text occurrence within a string, -1 if not found.

C: int TextFindIndex(const char *text, const char *search)"
  (text :string)
  (search :string))

(define-function ("TextToUpper" text-to-upper) :string
  "Get upper case version of provided string.

C: char * TextToUpper(const char *text)"
  (text :string))

(define-function ("TextToLower" text-to-lower) :string
  "Get lower case version of provided string.

C: char * TextToLower(const char *text)"
  (text :string))

(define-function ("TextToPascal" text-to-pascal) :string
  "Get Pascal case notation version of provided string.

C: char * TextToPascal(const char *text)"
  (text :string))

(define-function ("TextToSnake" text-to-snake) :string
  "Get Snake case notation version of provided string.

C: char * TextToSnake(const char *text)"
  (text :string))

(define-function ("TextToCamel" text-to-camel) :string
  "Get Camel case notation version of provided string.

C: char * TextToCamel(const char *text)"
  (text :string))

(define-function ("TextToInteger" text-to-integer) :int
  "Get integer value from text.

C: int TextToInteger(const char *text)"
  (text :string))

(define-function ("TextToFloat" text-to-float) :float
  "Get float value from text.

C: float TextToFloat(const char *text)"
  (text :string))

(define-function ("DrawLine3D" draw-line-3d) :void
  "Draw a line in 3D world space.

C: void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color)"
  (start-pos (:struct vector3))
  (end-pos (:struct vector3))
  (color (:struct color)))

(define-function ("DrawPoint3D" draw-point-3d) :void
  "Draw a point in 3D space, actually a small line.

C: void DrawPoint3D(Vector3 position, Color color)"
  (position (:struct vector3))
  (color (:struct color)))

(define-function ("DrawCircle3D" draw-circle-3d) :void
  "Draw a circle in 3D world space.

C: void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color)"
  (center (:struct vector3))
  (radius :float)
  (rotation-axis (:struct vector3))
  (rotation-angle :float)
  (color (:struct color)))

(define-function ("DrawTriangle3D" draw-triangle-3d) :void
  "Draw a color-filled triangle (vertex in counter-clockwise order!).

C: void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color)"
  (v1 (:struct vector3))
  (v2 (:struct vector3))
  (v3 (:struct vector3))
  (color (:struct color)))

(define-function ("DrawTriangleStrip3D" draw-triangle-strip-3d) :void
  "Draw a triangle strip defined by points.

C: void DrawTriangleStrip3D(const Vector3 *points, int pointCount, Color color)"
  (points (:array-of vector3))
  (point-count :int)
  (color (:struct color)))

(define-function ("DrawCube" draw-cube) :void
  "Draw cube.

C: void DrawCube(Vector3 position, float width, float height, float length, Color color)"
  (position (:struct vector3))
  (width :float)
  (height :float)
  (length :float)
  (color (:struct color)))

(define-function ("DrawCubeV" draw-cube-v) :void
  "Draw cube (Vector version).

C: void DrawCubeV(Vector3 position, Vector3 size, Color color)"
  (position (:struct vector3))
  (size (:struct vector3))
  (color (:struct color)))

(define-function ("DrawCubeWires" draw-cube-wires) :void
  "Draw cube wires.

C: void DrawCubeWires(Vector3 position, float width, float height, float length, Color color)"
  (position (:struct vector3))
  (width :float)
  (height :float)
  (length :float)
  (color (:struct color)))

(define-function ("DrawCubeWiresV" draw-cube-wires-v) :void
  "Draw cube wires (Vector version).

C: void DrawCubeWiresV(Vector3 position, Vector3 size, Color color)"
  (position (:struct vector3))
  (size (:struct vector3))
  (color (:struct color)))

(define-function ("DrawSphere" draw-sphere) :void
  "Draw sphere.

C: void DrawSphere(Vector3 centerPos, float radius, Color color)"
  (center-pos (:struct vector3))
  (radius :float)
  (color (:struct color)))

(define-function ("DrawSphereEx" draw-sphere-ex) :void
  "Draw sphere with extended parameters.

C: void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color)"
  (center-pos (:struct vector3))
  (radius :float)
  (rings :int)
  (slices :int)
  (color (:struct color)))

(define-function ("DrawSphereWires" draw-sphere-wires) :void
  "Draw sphere wires.

C: void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color)"
  (center-pos (:struct vector3))
  (radius :float)
  (rings :int)
  (slices :int)
  (color (:struct color)))

(define-function ("DrawCylinder" draw-cylinder) :void
  "Draw a cylinder/cone.

C: void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)"
  (position (:struct vector3))
  (radius-top :float)
  (radius-bottom :float)
  (height :float)
  (slices :int)
  (color (:struct color)))

(define-function ("DrawCylinderEx" draw-cylinder-ex) :void
  "Draw a cylinder with base at startPos and top at endPos.

C: void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)"
  (start-pos (:struct vector3))
  (end-pos (:struct vector3))
  (start-radius :float)
  (end-radius :float)
  (sides :int)
  (color (:struct color)))

(define-function ("DrawCylinderWires" draw-cylinder-wires) :void
  "Draw a cylinder/cone wires.

C: void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)"
  (position (:struct vector3))
  (radius-top :float)
  (radius-bottom :float)
  (height :float)
  (slices :int)
  (color (:struct color)))

(define-function ("DrawCylinderWiresEx" draw-cylinder-wires-ex) :void
  "Draw a cylinder wires with base at startPos and top at endPos.

C: void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)"
  (start-pos (:struct vector3))
  (end-pos (:struct vector3))
  (start-radius :float)
  (end-radius :float)
  (sides :int)
  (color (:struct color)))

(define-function ("DrawCapsule" draw-capsule) :void
  "Draw a capsule with the center of its sphere caps at startPos and endPos.

C: void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color)"
  (start-pos (:struct vector3))
  (end-pos (:struct vector3))
  (radius :float)
  (slices :int)
  (rings :int)
  (color (:struct color)))

(define-function ("DrawCapsuleWires" draw-capsule-wires) :void
  "Draw capsule wireframe with the center of its sphere caps at startPos and endPos.

C: void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color)"
  (start-pos (:struct vector3))
  (end-pos (:struct vector3))
  (radius :float)
  (slices :int)
  (rings :int)
  (color (:struct color)))

(define-function ("DrawPlane" draw-plane) :void
  "Draw a plane XZ.

C: void DrawPlane(Vector3 centerPos, Vector2 size, Color color)"
  (center-pos (:struct vector3))
  (size (:struct vector2))
  (color (:struct color)))

(define-function ("DrawRay" draw-ray) :void
  "Draw a ray line.

C: void DrawRay(Ray ray, Color color)"
  (ray (:struct ray))
  (color (:struct color)))

(define-function ("DrawGrid" draw-grid) :void
  "Draw a grid (centered at (0, 0, 0)).

C: void DrawGrid(int slices, float spacing)"
  (slices :int)
  (spacing :float))

(define-function ("LoadModel" load-model) (:struct model)
  "Load model from files (meshes and materials).

C: Model LoadModel(const char *fileName)"
  (file-name :string))

(define-function ("LoadModelFromMesh" load-model-from-mesh) (:struct model)
  "Load model from generated mesh (default material).

C: Model LoadModelFromMesh(Mesh mesh)"
  (mesh (:struct mesh)))

(define-function ("IsModelValid" is-model-valid) :bool
  "Check if a model is valid (loaded in GPU, VAO/VBOs).

C: bool IsModelValid(Model model)"
  (model (:struct model)))

(define-function ("UnloadModel" unload-model) :void
  "Unload model (including meshes) from memory (RAM and/or VRAM).

C: void UnloadModel(Model model)"
  (model (:struct model)))

(define-function ("GetModelBoundingBox" get-model-bounding-box) (:struct bounding-box)
  "Compute model bounding box limits (considers all meshes).

C: BoundingBox GetModelBoundingBox(Model model)"
  (model (:struct model)))

(define-function ("DrawModel" draw-model) :void
  "Draw a model (with texture if set).

C: void DrawModel(Model model, Vector3 position, float scale, Color tint)"
  (model (:struct model))
  (position (:struct vector3))
  (scale :float)
  (tint (:struct color)))

(define-function ("DrawModelEx" draw-model-ex) :void
  "Draw a model with extended parameters.

C: void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)"
  (model (:struct model))
  (position (:struct vector3))
  (rotation-axis (:struct vector3))
  (rotation-angle :float)
  (scale (:struct vector3))
  (tint (:struct color)))

(define-function ("DrawModelWires" draw-model-wires) :void
  "Draw a model wires (with texture if set).

C: void DrawModelWires(Model model, Vector3 position, float scale, Color tint)"
  (model (:struct model))
  (position (:struct vector3))
  (scale :float)
  (tint (:struct color)))

(define-function ("DrawModelWiresEx" draw-model-wires-ex) :void
  "Draw a model wires (with texture if set) with extended parameters.

C: void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)"
  (model (:struct model))
  (position (:struct vector3))
  (rotation-axis (:struct vector3))
  (rotation-angle :float)
  (scale (:struct vector3))
  (tint (:struct color)))

(define-function ("DrawBoundingBox" draw-bounding-box) :void
  "Draw bounding box (wires).

C: void DrawBoundingBox(BoundingBox box, Color color)"
  (box (:struct bounding-box))
  (color (:struct color)))

(define-function ("DrawBillboard" draw-billboard) :void
  "Draw a billboard texture.

C: void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float scale, Color tint)"
  (camera (:struct camera-3d))
  (texture (:struct texture))
  (position (:struct vector3))
  (scale :float)
  (tint (:struct color)))

(define-function ("DrawBillboardRec" draw-billboard-rec) :void
  "Draw a billboard texture defined by source.

C: void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint)"
  (camera (:struct camera-3d))
  (texture (:struct texture))
  (source (:struct rectangle))
  (position (:struct vector3))
  (size (:struct vector2))
  (tint (:struct color)))

(define-function ("DrawBillboardPro" draw-billboard-pro) :void
  "Draw a billboard texture defined by source and rotation.

C: void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint)"
  (camera (:struct camera-3d))
  (texture (:struct texture))
  (source (:struct rectangle))
  (position (:struct vector3))
  (up (:struct vector3))
  (size (:struct vector2))
  (origin (:struct vector2))
  (rotation :float)
  (tint (:struct color)))

(define-function ("UploadMesh" upload-mesh) :void
  "Upload mesh vertex data in GPU and provide VAO/VBO ids.

C: void UploadMesh(Mesh *mesh, bool dynamic)"
  (mesh (:inout mesh))
  (dynamic :bool))

(define-function ("UpdateMeshBuffer" update-mesh-buffer) :void
  "Update mesh vertex data in GPU for a specific buffer index.

C: void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset)"
  (mesh (:struct mesh))
  (index :int)
  (data :pointer)
  (data-size :int)
  (offset :int))

(define-function ("UnloadMesh" unload-mesh) :void
  "Unload mesh data from CPU and GPU.

C: void UnloadMesh(Mesh mesh)"
  (mesh (:struct mesh)))

(define-function ("DrawMesh" draw-mesh) :void
  "Draw a 3d mesh with material and transform.

C: void DrawMesh(Mesh mesh, Material material, Matrix transform)"
  (mesh (:struct mesh))
  (material (:struct material))
  (transform (:struct matrix)))

(define-function ("DrawMeshInstanced" draw-mesh-instanced) :void
  "Draw multiple mesh instances with material and different transforms.

C: void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances)"
  (mesh (:struct mesh))
  (material (:struct material))
  (transforms (:array-of matrix))
  (instances :int))

(define-function ("GetMeshBoundingBox" get-mesh-bounding-box) (:struct bounding-box)
  "Compute mesh bounding box limits.

C: BoundingBox GetMeshBoundingBox(Mesh mesh)"
  (mesh (:struct mesh)))

(define-function ("GenMeshTangents" gen-mesh-tangents) :void
  "Compute mesh tangents.

C: void GenMeshTangents(Mesh *mesh)"
  (mesh (:inout mesh)))

(define-function ("ExportMesh" export-mesh) :bool
  "Export mesh data to file, returns true on success.

C: bool ExportMesh(Mesh mesh, const char *fileName)"
  (mesh (:struct mesh))
  (file-name :string))

(define-function ("ExportMeshAsCode" export-mesh-as-code) :bool
  "Export mesh as code file (.h) defining multiple arrays of vertex attributes.

C: bool ExportMeshAsCode(Mesh mesh, const char *fileName)"
  (mesh (:struct mesh))
  (file-name :string))

(define-function ("GenMeshPoly" gen-mesh-poly) (:struct mesh)
  "Generate polygonal mesh.

C: Mesh GenMeshPoly(int sides, float radius)"
  (sides :int)
  (radius :float))

(define-function ("GenMeshPlane" gen-mesh-plane) (:struct mesh)
  "Generate plane mesh (with subdivisions).

C: Mesh GenMeshPlane(float width, float length, int resX, int resZ)"
  (width :float)
  (length :float)
  (res-x :int)
  (res-z :int))

(define-function ("GenMeshCube" gen-mesh-cube) (:struct mesh)
  "Generate cuboid mesh.

C: Mesh GenMeshCube(float width, float height, float length)"
  (width :float)
  (height :float)
  (length :float))

(define-function ("GenMeshSphere" gen-mesh-sphere) (:struct mesh)
  "Generate sphere mesh (standard sphere).

C: Mesh GenMeshSphere(float radius, int rings, int slices)"
  (radius :float)
  (rings :int)
  (slices :int))

(define-function ("GenMeshHemiSphere" gen-mesh-hemi-sphere) (:struct mesh)
  "Generate half-sphere mesh (no bottom cap).

C: Mesh GenMeshHemiSphere(float radius, int rings, int slices)"
  (radius :float)
  (rings :int)
  (slices :int))

(define-function ("GenMeshCylinder" gen-mesh-cylinder) (:struct mesh)
  "Generate cylinder mesh.

C: Mesh GenMeshCylinder(float radius, float height, int slices)"
  (radius :float)
  (height :float)
  (slices :int))

(define-function ("GenMeshCone" gen-mesh-cone) (:struct mesh)
  "Generate cone/pyramid mesh.

C: Mesh GenMeshCone(float radius, float height, int slices)"
  (radius :float)
  (height :float)
  (slices :int))

(define-function ("GenMeshTorus" gen-mesh-torus) (:struct mesh)
  "Generate torus mesh.

C: Mesh GenMeshTorus(float radius, float size, int radSeg, int sides)"
  (radius :float)
  (size :float)
  (rad-seg :int)
  (sides :int))

(define-function ("GenMeshKnot" gen-mesh-knot) (:struct mesh)
  "Generate trefoil knot mesh.

C: Mesh GenMeshKnot(float radius, float size, int radSeg, int sides)"
  (radius :float)
  (size :float)
  (rad-seg :int)
  (sides :int))

(define-function ("GenMeshHeightmap" gen-mesh-heightmap) (:struct mesh)
  "Generate heightmap mesh from image data.

C: Mesh GenMeshHeightmap(Image heightmap, Vector3 size)"
  (heightmap (:struct image))
  (size (:struct vector3)))

(define-function ("GenMeshCubicmap" gen-mesh-cubicmap) (:struct mesh)
  "Generate cubes-based map mesh from image data.

C: Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize)"
  (cubicmap (:struct image))
  (cube-size (:struct vector3)))

(define-function ("LoadMaterials" load-materials) :pointer
  "Load materials from model file.

C: Material * LoadMaterials(const char *fileName, int *materialCount)"
  (file-name :string)
  (material-count :pointer))

(define-function ("LoadMaterialDefault" load-material-default) (:struct material)
  "Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps).

C: Material LoadMaterialDefault()")

(define-function ("IsMaterialValid" is-material-valid) :bool
  "Check if a material is valid (shader assigned, map textures loaded in GPU).

C: bool IsMaterialValid(Material material)"
  (material (:struct material)))

(define-function ("UnloadMaterial" unload-material) :void
  "Unload material from GPU memory (VRAM).

C: void UnloadMaterial(Material material)"
  (material (:struct material)))

(define-function ("SetMaterialTexture" set-material-texture) :void
  "Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...).

C: void SetMaterialTexture(Material *material, int mapType, Texture2D texture)"
  (material (:inout material))
  (map-type (:enum material-map-index))
  (texture (:struct texture)))

(define-function ("SetModelMeshMaterial" set-model-mesh-material) :void
  "Set material for a mesh.

C: void SetModelMeshMaterial(Model *model, int meshId, int materialId)"
  (model (:inout model))
  (mesh-id :int)
  (material-id :int))

(define-function ("LoadModelAnimations" load-model-animations) :pointer
  "Load model animations from file.

C: ModelAnimation * LoadModelAnimations(const char *fileName, int *animCount)"
  (file-name :string)
  (anim-count :pointer))

(define-function ("UpdateModelAnimation" update-model-animation) :void
  "Update model animation pose (vertex buffers and bone matrices).

C: void UpdateModelAnimation(Model model, ModelAnimation anim, float frame)"
  (model (:struct model))
  (anim (:struct model-animation))
  (frame :float))

(define-function ("UpdateModelAnimationEx" update-model-animation-ex) :void
  "Update model animation pose, blending two animations.

C: void UpdateModelAnimationEx(Model model, ModelAnimation animA, float frameA, ModelAnimation animB, float frameB, float blend)"
  (model (:struct model))
  (anim-a (:struct model-animation))
  (frame-a :float)
  (anim-b (:struct model-animation))
  (frame-b :float)
  (blend :float))

(define-function ("UnloadModelAnimations" unload-model-animations) :void
  "Unload animation array data.

C: void UnloadModelAnimations(ModelAnimation *animations, int animCount)"
  (animations :pointer)
  (anim-count :int))

(define-function ("IsModelAnimationValid" is-model-animation-valid) :bool
  "Check model animation skeleton match.

C: bool IsModelAnimationValid(Model model, ModelAnimation anim)"
  (model (:struct model))
  (anim (:struct model-animation)))

(define-function ("CheckCollisionSpheres" check-collision-spheres) :bool
  "Check collision between two spheres.

C: bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2)"
  (center1 (:struct vector3))
  (radius1 :float)
  (center2 (:struct vector3))
  (radius2 :float))

(define-function ("CheckCollisionBoxes" check-collision-boxes) :bool
  "Check collision between two bounding boxes.

C: bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2)"
  (box1 (:struct bounding-box))
  (box2 (:struct bounding-box)))

(define-function ("CheckCollisionBoxSphere" check-collision-box-sphere) :bool
  "Check collision between box and sphere.

C: bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius)"
  (box (:struct bounding-box))
  (center (:struct vector3))
  (radius :float))

(define-function ("GetRayCollisionSphere" get-ray-collision-sphere) (:struct ray-collision)
  "Get collision info between ray and sphere.

C: RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius)"
  (ray (:struct ray))
  (center (:struct vector3))
  (radius :float))

(define-function ("GetRayCollisionBox" get-ray-collision-box) (:struct ray-collision)
  "Get collision info between ray and box.

C: RayCollision GetRayCollisionBox(Ray ray, BoundingBox box)"
  (ray (:struct ray))
  (box (:struct bounding-box)))

(define-function ("GetRayCollisionMesh" get-ray-collision-mesh) (:struct ray-collision)
  "Get collision info between ray and mesh.

C: RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform)"
  (ray (:struct ray))
  (mesh (:struct mesh))
  (transform (:struct matrix)))

(define-function ("GetRayCollisionTriangle" get-ray-collision-triangle) (:struct ray-collision)
  "Get collision info between ray and triangle.

C: RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3)"
  (ray (:struct ray))
  (p1 (:struct vector3))
  (p2 (:struct vector3))
  (p3 (:struct vector3)))

(define-function ("GetRayCollisionQuad" get-ray-collision-quad) (:struct ray-collision)
  "Get collision info between ray and quad.

C: RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)"
  (ray (:struct ray))
  (p1 (:struct vector3))
  (p2 (:struct vector3))
  (p3 (:struct vector3))
  (p4 (:struct vector3)))

(define-function ("InitAudioDevice" init-audio-device) :void
  "Initialize audio device and context.

C: void InitAudioDevice()")

(define-function ("CloseAudioDevice" close-audio-device) :void
  "Close the audio device and context.

C: void CloseAudioDevice()")

(define-function ("IsAudioDeviceReady" is-audio-device-ready) :bool
  "Check if audio device has been initialized successfully.

C: bool IsAudioDeviceReady()")

(define-function ("SetMasterVolume" set-master-volume) :void
  "Set master volume (listener).

C: void SetMasterVolume(float volume)"
  (volume :float))

(define-function ("GetMasterVolume" get-master-volume) :float
  "Get master volume (listener).

C: float GetMasterVolume()")

(define-function ("LoadWave" load-wave) (:struct wave)
  "Load wave data from file.

C: Wave LoadWave(const char *fileName)"
  (file-name :string))

(define-function ("LoadWaveFromMemory" load-wave-from-memory) (:struct wave)
  "Load wave from memory buffer, fileType refers to extension: i.e. '.wav'.

C: Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)"
  (file-type :string)
  (file-data :pointer)
  (data-size :int))

(define-function ("IsWaveValid" is-wave-valid) :bool
  "Checks if wave data is valid (data loaded and parameters).

C: bool IsWaveValid(Wave wave)"
  (wave (:struct wave)))

(define-function ("LoadSound" load-sound) (:struct sound)
  "Load sound from file.

C: Sound LoadSound(const char *fileName)"
  (file-name :string))

(define-function ("LoadSoundFromWave" load-sound-from-wave) (:struct sound)
  "Load sound from wave data.

C: Sound LoadSoundFromWave(Wave wave)"
  (wave (:struct wave)))

(define-function ("LoadSoundAlias" load-sound-alias) (:struct sound)
  "Create a new sound that shares the same sample data as the source sound, does not own the sound data.

C: Sound LoadSoundAlias(Sound source)"
  (source (:struct sound)))

(define-function ("IsSoundValid" is-sound-valid) :bool
  "Checks if a sound is valid (data loaded and buffers initialized).

C: bool IsSoundValid(Sound sound)"
  (sound (:struct sound)))

(define-function ("UpdateSound" update-sound) :void
  "Update sound buffer with new data (default data format: 32 bit float, stereo).

C: void UpdateSound(Sound sound, const void *data, int sampleCount)"
  (sound (:struct sound))
  (data :pointer)
  (sample-count :int))

(define-function ("UnloadWave" unload-wave) :void
  "Unload wave data.

C: void UnloadWave(Wave wave)"
  (wave (:struct wave)))

(define-function ("UnloadSound" unload-sound) :void
  "Unload sound.

C: void UnloadSound(Sound sound)"
  (sound (:struct sound)))

(define-function ("UnloadSoundAlias" unload-sound-alias) :void
  "Unload a sound alias (does not deallocate sample data).

C: void UnloadSoundAlias(Sound alias)"
  (alias (:struct sound)))

(define-function ("ExportWave" export-wave) :bool
  "Export wave data to file, returns true on success.

C: bool ExportWave(Wave wave, const char *fileName)"
  (wave (:struct wave))
  (file-name :string))

(define-function ("ExportWaveAsCode" export-wave-as-code) :bool
  "Export wave sample data to code (.h), returns true on success.

C: bool ExportWaveAsCode(Wave wave, const char *fileName)"
  (wave (:struct wave))
  (file-name :string))

(define-function ("PlaySound" play-sound) :void
  "Play a sound.

C: void PlaySound(Sound sound)"
  (sound (:struct sound)))

(define-function ("StopSound" stop-sound) :void
  "Stop playing a sound.

C: void StopSound(Sound sound)"
  (sound (:struct sound)))

(define-function ("PauseSound" pause-sound) :void
  "Pause a sound.

C: void PauseSound(Sound sound)"
  (sound (:struct sound)))

(define-function ("ResumeSound" resume-sound) :void
  "Resume a paused sound.

C: void ResumeSound(Sound sound)"
  (sound (:struct sound)))

(define-function ("IsSoundPlaying" is-sound-playing) :bool
  "Check if a sound is currently playing.

C: bool IsSoundPlaying(Sound sound)"
  (sound (:struct sound)))

(define-function ("SetSoundVolume" set-sound-volume) :void
  "Set volume for a sound (1.0 is max level).

C: void SetSoundVolume(Sound sound, float volume)"
  (sound (:struct sound))
  (volume :float))

(define-function ("SetSoundPitch" set-sound-pitch) :void
  "Set pitch for a sound (1.0 is base level).

C: void SetSoundPitch(Sound sound, float pitch)"
  (sound (:struct sound))
  (pitch :float))

(define-function ("SetSoundPan" set-sound-pan) :void
  "Set pan for a sound (-1.0 left, 0.0 center, 1.0 right).

C: void SetSoundPan(Sound sound, float pan)"
  (sound (:struct sound))
  (pan :float))

(define-function ("WaveCopy" wave-copy) (:struct wave)
  "Copy a wave to a new wave.

C: Wave WaveCopy(Wave wave)"
  (wave (:struct wave)))

(define-function ("WaveCrop" wave-crop) :void
  "Crop a wave to defined frames range.

C: void WaveCrop(Wave *wave, int initFrame, int finalFrame)"
  (wave (:inout wave))
  (init-frame :int)
  (final-frame :int))

(define-function ("WaveFormat" wave-format) :void
  "Convert wave data to desired format.

C: void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels)"
  (wave (:inout wave))
  (sample-rate :int)
  (sample-size :int)
  (channels :int))

(define-function ("LoadWaveSamples" load-wave-samples) :pointer
  "Load samples data from wave as a 32bit float data array.

C: float * LoadWaveSamples(Wave wave)"
  (wave (:struct wave)))

(define-function ("UnloadWaveSamples" unload-wave-samples) :void
  "Unload samples data loaded with LoadWaveSamples().

C: void UnloadWaveSamples(float *samples)"
  (samples :pointer))

(define-function ("LoadMusicStream" load-music-stream) (:struct music)
  "Load music stream from file.

C: Music LoadMusicStream(const char *fileName)"
  (file-name :string))

(define-function ("LoadMusicStreamFromMemory" load-music-stream-from-memory) (:struct music)
  "Load music stream from data.

C: Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize)"
  (file-type :string)
  (data :pointer)
  (data-size :int))

(define-function ("IsMusicValid" is-music-valid) :bool
  "Checks if a music stream is valid (context and buffers initialized).

C: bool IsMusicValid(Music music)"
  (music (:struct music)))

(define-function ("UnloadMusicStream" unload-music-stream) :void
  "Unload music stream.

C: void UnloadMusicStream(Music music)"
  (music (:struct music)))

(define-function ("PlayMusicStream" play-music-stream) :void
  "Start music playing.

C: void PlayMusicStream(Music music)"
  (music (:struct music)))

(define-function ("IsMusicStreamPlaying" is-music-stream-playing) :bool
  "Check if music is playing.

C: bool IsMusicStreamPlaying(Music music)"
  (music (:struct music)))

(define-function ("UpdateMusicStream" update-music-stream) :void
  "Updates buffers for music streaming.

C: void UpdateMusicStream(Music music)"
  (music (:struct music)))

(define-function ("StopMusicStream" stop-music-stream) :void
  "Stop music playing.

C: void StopMusicStream(Music music)"
  (music (:struct music)))

(define-function ("PauseMusicStream" pause-music-stream) :void
  "Pause music playing.

C: void PauseMusicStream(Music music)"
  (music (:struct music)))

(define-function ("ResumeMusicStream" resume-music-stream) :void
  "Resume playing paused music.

C: void ResumeMusicStream(Music music)"
  (music (:struct music)))

(define-function ("SeekMusicStream" seek-music-stream) :void
  "Seek music to a position (in seconds).

C: void SeekMusicStream(Music music, float position)"
  (music (:struct music))
  (position :float))

(define-function ("SetMusicVolume" set-music-volume) :void
  "Set volume for music (1.0 is max level).

C: void SetMusicVolume(Music music, float volume)"
  (music (:struct music))
  (volume :float))

(define-function ("SetMusicPitch" set-music-pitch) :void
  "Set pitch for a music (1.0 is base level).

C: void SetMusicPitch(Music music, float pitch)"
  (music (:struct music))
  (pitch :float))

(define-function ("SetMusicPan" set-music-pan) :void
  "Set pan for a music (-1.0 left, 0.0 center, 1.0 right).

C: void SetMusicPan(Music music, float pan)"
  (music (:struct music))
  (pan :float))

(define-function ("GetMusicTimeLength" get-music-time-length) :float
  "Get music time length (in seconds).

C: float GetMusicTimeLength(Music music)"
  (music (:struct music)))

(define-function ("GetMusicTimePlayed" get-music-time-played) :float
  "Get current music time played (in seconds).

C: float GetMusicTimePlayed(Music music)"
  (music (:struct music)))

(define-function ("LoadAudioStream" load-audio-stream) (:struct audio-stream)
  "Load audio stream (to stream raw audio pcm data).

C: AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels)"
  (sample-rate :uint)
  (sample-size :uint)
  (channels :uint))

(define-function ("IsAudioStreamValid" is-audio-stream-valid) :bool
  "Checks if an audio stream is valid (buffers initialized).

C: bool IsAudioStreamValid(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("UnloadAudioStream" unload-audio-stream) :void
  "Unload audio stream and free memory.

C: void UnloadAudioStream(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("UpdateAudioStream" update-audio-stream) :void
  "Update audio stream buffers with data.

C: void UpdateAudioStream(AudioStream stream, const void *data, int frameCount)"
  (stream (:struct audio-stream))
  (data :pointer)
  (frame-count :int))

(define-function ("IsAudioStreamProcessed" is-audio-stream-processed) :bool
  "Check if any audio stream buffers requires refill.

C: bool IsAudioStreamProcessed(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("PlayAudioStream" play-audio-stream) :void
  "Play audio stream.

C: void PlayAudioStream(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("PauseAudioStream" pause-audio-stream) :void
  "Pause audio stream.

C: void PauseAudioStream(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("ResumeAudioStream" resume-audio-stream) :void
  "Resume audio stream.

C: void ResumeAudioStream(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("IsAudioStreamPlaying" is-audio-stream-playing) :bool
  "Check if audio stream is playing.

C: bool IsAudioStreamPlaying(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("StopAudioStream" stop-audio-stream) :void
  "Stop audio stream.

C: void StopAudioStream(AudioStream stream)"
  (stream (:struct audio-stream)))

(define-function ("SetAudioStreamVolume" set-audio-stream-volume) :void
  "Set volume for audio stream (1.0 is max level).

C: void SetAudioStreamVolume(AudioStream stream, float volume)"
  (stream (:struct audio-stream))
  (volume :float))

(define-function ("SetAudioStreamPitch" set-audio-stream-pitch) :void
  "Set pitch for audio stream (1.0 is base level).

C: void SetAudioStreamPitch(AudioStream stream, float pitch)"
  (stream (:struct audio-stream))
  (pitch :float))

(define-function ("SetAudioStreamPan" set-audio-stream-pan) :void
  "Set pan for audio stream (-1.0 to 1.0 range, 0.0 is centered).

C: void SetAudioStreamPan(AudioStream stream, float pan)"
  (stream (:struct audio-stream))
  (pan :float))

(define-function ("SetAudioStreamBufferSizeDefault" set-audio-stream-buffer-size-default) :void
  "Default size for new audio streams.

C: void SetAudioStreamBufferSizeDefault(int size)"
  (size :int))

(define-function ("SetAudioStreamCallback" set-audio-stream-callback) :void
  "Audio thread callback to request new data.

C: void SetAudioStreamCallback(AudioStream stream, AudioCallback callback)"
  (stream (:struct audio-stream))
  (callback :pointer))

(define-function ("AttachAudioStreamProcessor" attach-audio-stream-processor) :void
  "Attach audio stream processor to stream, receives frames x 2 samples as 'float' (stereo).

C: void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor)"
  (stream (:struct audio-stream))
  (processor :pointer))

(define-function ("DetachAudioStreamProcessor" detach-audio-stream-processor) :void
  "Detach audio stream processor from stream.

C: void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor)"
  (stream (:struct audio-stream))
  (processor :pointer))

(define-function ("AttachAudioMixedProcessor" attach-audio-mixed-processor) :void
  "Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'float' (stereo).

C: void AttachAudioMixedProcessor(AudioCallback processor)"
  (processor :pointer))

(define-function ("DetachAudioMixedProcessor" detach-audio-mixed-processor) :void
  "Detach audio stream processor from the entire audio pipeline.

C: void DetachAudioMixedProcessor(AudioCallback processor)"
  (processor :pointer))

;;; Deprecated names

(define-function-alias get-mouse-ray get-screen-to-world-ray)
