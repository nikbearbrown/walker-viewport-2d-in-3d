# walker-viewport-2d-in-3d — Implementation map

| | |
|---|---|
| Version | 0.1.0-recovered |
| Date | 2026-09-27 |
| Author | Zelda (agent, silent) for Nik Bear Brown |
| Mode | recovered, silent (`/gdd reverse --path godot`) |

gate — unsigned at time of writing

Every row is `[OBSERVED]` from the file and line cited unless marked `[INFERRED]` or proposed. Engine detected from `godot/project.godot` (`config_version=5`, features "4.7", `gl_compatibility`). No git history was read. No `*.log` files exist in this folder; run evidence is the prose in `VERIFICATION.md` and `FRICTIONAL.md`. No `diagnostic-*` sibling folders exist for this project.

## Scenes and scripts

| Path | Root / extends | Owns | Line refs |
|---|---|---|---|
| `godot/2d_in_3d.tscn` | `Node3D` "2Din3D" (script `2d_in_3d.gd`) | the whole demo: Camera3D, ViewportQuad, SubViewport + Pong subtree, Environment | root 64-65; Camera3D 67-69; ViewportQuad 71-74; SubViewport 76-78; Pong 80-81; Background Panel 83-85; Ball 87-89; LeftPaddle 91-93; RightPaddle 95-97; Separator 99-101; Environment 103-165 |
| `godot/2d_in_3d.gd` | `extends Node3D` | texture binding, viewport clear mode, camera idle | const 4; `counter` 6; `camera_base_rotation` 7; `_ready` 9-15; `_process` 18-23 |
| `godot/pong.gd` | `extends Node2D` | Pong rules and paddle input | consts 3-4; state vars 6-11; `@onready` nodes 13-15; `_ready` 17-19; `_process` 22-70 |
| `godot/test_input.gd` | `extends SceneTree` | T-01 input, texture identity, size, bounds | `key()` 6-11; probe 13-50 |
| `godot/test_ball.gd` | `extends "res://test_input.gd"` | T-02 paddle rebound, miss reset | 3-38 |
| `godot/test_rally.gd` | `extends "res://test_input.gd"` | T-03 input-feedback rally | 4-39 |

No `class_name`, `@export`, `signal`, or `@rpc` in any script (grep, 2026-09-27). `.godot/global_script_class_cache.cfg` is `list=[]`.

## Tuning values (observed, not approved)

| Value | Where |
|---|---|
| `CAMERA_IDLE_SCALE = 0.005` | `godot/2d_in_3d.gd:4` |
| `PAD_SPEED = 150` | `godot/pong.gd:3` |
| `INITIAL_BALL_SPEED = 80.0` | `godot/pong.gd:4` |
| speed-up ×1.1 per paddle hit, no cap | `godot/pong.gd:38` |
| rebound y = `randf() * 2.0 - 1` | `godot/pong.gd:39` |
| `screen_size` default 640×400, replaced at `_ready` | `godot/pong.gd:7, 18` |
| `pad_size` default 8×32, replaced by left paddle texture size | `godot/pong.gd:11, 19` |
| SubViewport 600×400, update mode 4 | `godot/2d_in_3d.tscn:77-78` |
| Camera at (0, 1.35, 0.5), fov 60 | `godot/2d_in_3d.tscn:68-69` |
| Ball (300,200); paddles (20,200), (580,200); separator (298,200) | `godot/2d_in_3d.tscn:88, 92, 96, 100` |
| Light energy 0.15, shadow max distance 10 | `godot/2d_in_3d.tscn:158, 165` |

## project.godot

| Section | Content | Lines |
|---|---|---|
| `[application]` | name "Walker 2D in 3D"; description; tags; main scene `res://2d_in_3d.tscn`; features "4.7"; icon | 11-18 |
| `[debug]` | `untyped_declaration=1` | 20-22 |
| `[input]` | four actions (below) | 24-45 |
| `[rendering]` | `gl_compatibility` (+ mobile); soft shadow quality 4; MSAA 3D 2 | 47-52 |
| `[autoload]` | absent | — |
| `[layer_names]` | absent; no physics bodies exist | — |

## Input actions

| Action | Key (physical keycode) | Deadzone | Used at |
|---|---|---|---|
| `left_move_up` | W (87) | 0.2 | `godot/project.godot:26-30`; `godot/pong.gd:53` |
| `left_move_down` | S (83) | 0.2 | `godot/project.godot:31-35`; `godot/pong.gd:55` |
| `right_move_up` | Up (4194320) | 0.2 | `godot/project.godot:36-40`; `godot/pong.gd:64` |
| `right_move_down` | Down (4194322) | 0.2 | `godot/project.godot:41-45`; `godot/pong.gd:66` |

## Collision layers, autoloads, network surface

None. No physics bodies, no areas, no autoloads, no ports, no RPCs, no signals. Collisions are `Rect2.has_point` tests in `godot/pong.gd:25-26, 36`.

## Assets

| Category | Count | Files | Maturity |
|---|---|---|---|
| Sprites (PNG) | 4 | `ball.png` 8×8, `left_pallete.png` 8×32, `right_pallete.png` 8×32, `separator.png` 2×400 | L1 placeholder-grade, upstream |
| Icon | 1 | `icon.webp` | upstream |
| Screenshots | 1 | `screenshots/2d_in_3d.webp` (upstream, not a Walker capture) | upstream |
| Materials / meshes | inline sub-resources | 9 `StandardMaterial3D`, `PlaneMesh`, 2 `BoxMesh`, sky, environment in `2d_in_3d.tscn:10-62` | L1 |
| Audio, fonts, shaders | 0 | — | — |

## Feature id → code

| ID | Feature | Code | Verified by |
|---|---|---|---|
| F-01 | Pong in a SubViewport | `godot/2d_in_3d.tscn:76-101` | T-01 size check (`FRICTIONAL.md:17-18`) |
| F-02 | ViewportTexture on the quad | `godot/2d_in_3d.gd:11-15`; quad `godot/2d_in_3d.tscn:71-74` | T-01 identity (`FRICTIONAL.md:17-18`); pixels unverified (`VERIFICATION.md:23-25`) |
| F-03 | Keyboard paddles | `godot/project.godot:24-45`; `godot/pong.gd:50-70` | T-01 (`FRICTIONAL.md:15-17`) |
| F-04 | Pong rules | `godot/pong.gd:28-48` | T-02, T-03 (`FRICTIONAL.md:31-35, 47-49`) |
| F-05 | Centre clamp (Walker change) | `godot/pong.gd:58-59, 69` | T-01 bounds (`FRICTIONAL.md:23-28`) |
| F-06 | 3D stage | `godot/2d_in_3d.tscn:103-165` | none |
| F-07 | Camera idle | `godot/2d_in_3d.gd:18-23` | none |
| F-08 | Test harness | `godot/test_input.gd`, `test_ball.gd`, `test_rally.gd` | results in `VERIFICATION.md:5-14` |

## Diagnostics, test harnesses, evidence

| Item | Kind | Evidence value |
|---|---|---|
| `godot/test_input.gd`, `test_ball.gd`, `test_rally.gd` | headless SceneTree probes, real key events only | state evidence, not visual (`VERIFICATION.md:3, 14`) |
| `VERIFICATION.md` | verification boundary | lists what passed and what is still required |
| `FRICTIONAL.md` | dated run log, 2026-09-21 21:26 to 2026-09-22 00:05 UTC, session ids 88640, 64948, 88656, 44739, 60598, 97299 | prose only; no log files kept |
| `godot/README.md` | upstream README | technique description |
| `*.log`, `CAPTURE-PLAN.md`, `NETWORK-TEST-PLAN.md`, `diagnostic-*` | absent | — |
