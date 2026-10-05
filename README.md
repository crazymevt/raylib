# raylib — raylib 6.0 for Common Lisp

Bindings for [raylib](https://www.raylib.com/) 6.0, generated from raylib's own
API description, with a thin Lispy layer for writing games from the REPL.

```lisp
(defun my-game ()
  (rl:with-window (800 450 "Hello")
    (rl:with-resources ((hero (rl:load-texture "/path/to/hero.png")))
      (rl:game-loop (dt)
        (rl:with-drawing (:raywhite)
          (rl:draw-texture-v hero (rl:vec2 100 100) :white)
          (rl:draw-text "Hello from Lisp" 10 10 20 :darkgray))))))

(rl:run 'my-game)   ; from the REPL: returns at once, the game runs alongside
```

## Requirements

- SBCL with Quicklisp
- raylib 6.0: `brew install raylib` (macOS), or your package manager
- A C compiler (macOS: `xcode-select --install`). On first load, the bindings
  compile a small C shim into `build/`.

## Using it

Every raylib function is in the `raylib` package (nickname `rl`), named in
Lisp style: `DrawTextureV` is `rl:draw-texture-v`, `IsKeyDown` is
`rl:is-key-down`, `BeginMode2D` is `rl:begin-mode-2d`. Each has raylib's
description and C signature as its docstring. The
[raylib cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html) is the
reference.

**Structs** are Lisp structures with raylib's fields: `(rl:make-vector2 :x 1 :y 2)`,
`(rl:texture-width tex)`, `(rl:camera-2d-target cam)`. Short forms:
`(rl:vec2 x y)`, `(rl:vec3 x y z)`, `(rl:rect x y w h)`, `(rl:color r g b [a])`.
Wherever raylib takes a vector, rectangle or color, a list or vector of
numbers works too: `(rl:draw-rectangle-rec '(10 10 50 50) '(255 0 0))`.

**Colors** can also be keywords from raylib's palette (`:red`, `:raywhite`,
`:darkgreen`, see `(rl:color-keywords)`) or integers `#xRRGGBBAA`.

**Enums** are keywords: `(rl:is-key-down :space)`, `(rl:is-mouse-button-pressed :left)`,
`(rl:set-config-flags '(:window-resizable :vsync-hint))`. Integers still work.
`(rl:enum-keywords 'rl:keyboard-key)` lists the choices.

**Numbers**: float parameters accept any real; int parameters round floats.

**Strings** can be pathnames, and NIL passes NULL.

**Functions that modify a struct** (`ImageCrop(Image *image, ...)`,
`UpdateCamera(Camera *camera, ...)`) update the Lisp structure you pass.
**Arrays** of structs (`const Vector2 *points`) take any sequence.

### The Lispy layer

| | |
| --- | --- |
| `(rl:run fn &key wait)` | Run FN where it can open a window. On macOS that's the main thread; from a REPL, `run` hands it over and returns at once. |
| `(rl:stop)`, `(rl:resume)`, `(rl:running-p)` | Control a running game from the REPL. |
| `(rl:with-window (w h title &key fps flags exit-key log-level) ...)` | Open and always close the window. |
| `(rl:game-loop (dt) ...)` | Once per frame until the window closes or `(rl:stop)`. |
| `(rl:with-drawing (clear-color) ...)` | `begin-drawing` / `end-drawing`. |
| `with-mode-2d`, `with-mode-3d`, `with-texture-mode`, `with-shader-mode`, `with-blend-mode`, `with-scissor-mode`, `with-audio-device` | The other begin/end pairs. |
| `(rl:with-resources ((var form) ...) ...)` | Load, check it loaded (else `rl:resource-load-error`), and unload. |
| `rl:unload`, `rl:valid-p` | Work on any texture, image, font, sound, music, shader, model, ... |
| `v2+ v2- v2* v2/ v2-dot v2-length v2-distance v2-normalize v2-lerp v2-rotate v2-angle` | 2D vector math in Lisp. |

### Live coding

Inside `game-loop`, an error doesn't end the game. The window shows the
error and the REPL gets a backtrace. Fix the function and press F5 in the game,
or call `(rl:resume)`, and it continues from the next frame. To make
redefinitions take effect, keep the game's work in named functions that the
loop calls, as `examples/walker.lisp` does.

### Notes

- raylib loads files relative to the process's working directory. Use absolute paths
  or `(asdf:system-relative-pathname :my-game "assets/hero.png")`.
- raylib's log goes to the process's standard output, not the REPL. `with-window`
  sets it to `:warning` by default.
- Renamed to avoid collisions with functions of the same name: `Image` and `Texture`'s
  `format` and `mipmaps` fields are `pixel-format` and `mipmap-count`
  (`ImageFormat` and `ImageMipmaps` are functions), and the `ModelSkeleton` struct is
  `rl:skeleton`.
- `TraceLog` and `TextFormat` are left out because they're variadic. Use `format`.

## Example

```lisp
(ql:quickload :raylib/examples)
(rl:run 'raylib-examples:walker)
```

## How it's built

| Path | Contents |
| --- | --- |
| `spec/raylib_api.json` | raylib's API description, from `tools/rlparser/output` in the raylib 6.0 source |
| `generator/` | Reads the description, writes `src/generated/` (system `raylib-generator`) |
| `src/generated/raylib.lisp` | Declarations: `define-enum`, `define-struct`, `define-function`, ... |
| `src/generated/shim.c` | C wrappers taking pointers for the functions that pass structs by value |
| `src/runtime/` | The macros behind the declarations, library loading, the main-thread runner |
| `src/lisp/` | The Lispy layer |

Functions that pass or return structs by value go through the shim, so no
libffi is needed and calls take tens of nanoseconds. On load, the bindings
check that every struct is the same size in Lisp as in C.

To regenerate after changing the generator or updating `spec/raylib_api.json`:

```lisp
(ql:quickload :raylib-generator)
(raylib.generator:generate)
```

Tests: `(asdf:test-system :raylib)`. One of them opens a window for half a second.
