# Frictional log

2026-09-21 21:26UTC: Existing target absent, so copied upstream viewport/2d_in_3d
to independent godot/ folder, retained MIT notice and original README/assets,
changed only application title. Both scripts inspected; no AGENTS.md found in
source tree. Godot4.7.2 headless import88640 exit0;120-frame idle run exit0
without reported errors. This does not verify visible viewport rendering.

Next: normal keyboard input and viewport texture-binding diagnostics. Source
camera idle uses base_rotation.y for all axes; investigate only if evidence
shows unintended behavior. No speculative fix made. Shared recording-window
blocker persists; no visible windows opened and no film produced. Bomber and
earlier film pairs remain pending, not retired.

2026-09-21 21:58UTC: test_input.gd sends actual physical W/S/Up/Down events,
holding each150ms; all four move the appropriate paddle in the expected
direction (about21.7–22.4px, not a timing benchmark). Quad material's texture
matches SubViewport.get_texture and Pong reads its600x400 viewport size.
Headless process exits0 clean with orderly scene release. These are state
checks, not proof of rendered pixels, ball collision or paddle-bound correctness.
No runtime changes, visible windows, captures or films.

2026-09-21 22:29UTC: Three-second simultaneous up/down input holds expose
center overshoot on both paddles: y=-0.916/-0.444 then400.625/400.055;
session64948 exits1. Added local post-integration clamp preserving original
center bounds0..400 (not a half-sprite inset). Retest88656 exits0 clean:
both centers exactly0 and400; four direction tests and viewport binding/size
regressions pass. Source checkout untouched. Ball collision/reset and visible
rendering remain unverified; no capture or films created.

2026-09-21 23:01UTC: test_ball.gd observes the unmodified initial trajectory
reach the left paddle: direction reverses, speed becomes88 and direction is
normalized. In a fresh scene, an actual1.5s W hold moves the paddle away;
ball misses and resets to(300,200), speed80, directionLEFT. Session44739
exits0 clean. No ball/paddle state assignments, direct process calls or clock
retiming. Right-paddle and roof/floor bounces not covered yet. Headless state
evidence is not visual evidence; capture blocker and pending films unchanged.

2026-09-21 23:33UTC: Added bounded30s feedback-controlled rally using only
W/S/Up/Down events to track the ball. Session60598 observed right-paddle and
floor direction reversals, but no roof reversal before timeout; exits1 for
incomplete coverage, not evidence of a roof collision defect. Random rebound
angles remain unchanged, no positions assigned and no time scaling. Upstream
diff confirms only post-integration paddle clamps in pong.gd. Roof behavior
and rendered pixels still unverified. No films or visible capture created.

2026-09-22 00:05UTC: One bounded rerun of unchanged input-feedback rally
(97299) observes right-paddle, roof and floor reversals and exits0 clean.
Earlier timeout remains documented; random-angle coverage is not guaranteed
on each30s run. Added VERIFICATION.md to separate state/input evidence from
missing GPU/presentation/film evidence. No runtime changes or visible capture.
Both films remain pending; may inspect next feasible source while blocked.
