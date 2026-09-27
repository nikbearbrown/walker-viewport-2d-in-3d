# Walker 2D in 3D

A Walker adaptation of the upstream Godot demo `viewport/2d_in_3d`: a small
two-player Pong game rendered by a SubViewport, whose texture is assigned to a
quad inside a 3D scene. It is a tech demo of one rendering technique, not a
game. It is an independent adaptation of the upstream demo, source commit
a3b5c113112f77291d5f3d1360f33a882fdc52f7; the original checkout is untouched.
Headless checks of input, viewport binding/size and paddle center bounds pass,
and ball rebound/reset behaviour has been observed headless; rendered-image
checks remain pending. Source inspection is not visual verification.

## How to run

Open `godot/project.godot` in Godot 4.7 (`config/features` "4.7"; the headless
runs recorded in `FRICTIONAL.md` used Godot 4.7.2). Renderer: Compatibility
(`gl_compatibility`). Main scene: `godot/2d_in_3d.tscn`.

Controls: W/S move the left paddle, Up/Down move the right paddle (physical
keys). A camera idle animation moves the view. There are no command-line flags.

Headless test scripts live in `godot/`: `test_input.gd`, `test_ball.gd`,
`test_rally.gd` (SceneTree scripts that send real key events). What each
covers, and what it does not, is recorded in `VERIFICATION.md`.

## Design

- [GDD.md](GDD.md) (identical copy of [design/GDD.md](design/GDD.md); its
  image and diagram links resolve from `design/`)
- [design/DECK.html](design/DECK.html)
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md)
- [design/decisions.md](design/decisions.md)

The GDD is a recovered, unapproved description of what the code does (silent
Zelda `/gdd reverse` pass, 2026-09-27). No design gate is signed. It lists 14
open questions, owned by Nik Bear Brown.

## Source & license

Independent adaptation of Godot demo `viewport/2d_in_3d`, source commit
a3b5c113112f77291d5f3d1360f33a882fdc52f7. Original checkout untouched; MIT
license (Godot Engine contributors, see `LICENSE.md`) and the original
README/assets are retained in this project (`godot/README.md`). Changes in
this adaptation: the application title, and a post-integration paddle clamp in
`godot/pong.gd`; the three test scripts were added.

## Status

- Physical-key direction and held-key center-bound tests pass. Local paddle
  integration now clamps centers to 0..400 after movement, preserving the
  source's center-bound convention (not keeping the entire sprite inside the
  screen).
- Viewport binding/size checks pass; rendered-image checks remain pending.
- Headless ball checks: a natural left-paddle rebound and an input-driven miss
  reset are observed; one bounded rally run observed right-paddle, roof and
  floor reversals, while an earlier run timed out without a roof reversal
  (see `FRICTIONAL.md` and `VERIFICATION.md`). These are state checks, not
  visual evidence or human play.
- The shared visible recording blocker applies here too; neither of the two
  planned narrated 4K films exists yet.
- Earlier Walker projects remain unfinished, not retired.

Repository: https://github.com/nikbearbrown/walker-viewport-2d-in-3d
