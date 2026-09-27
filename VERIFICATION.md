# Verification boundary

This is a headless verification record, not film QA or human approval.

- Godot4.7.2 import and120-frame idle run exit0.
- test_input.gd sends physical W/S/Up/Down events. Direction checks and held-key
  center bounds pass, as do600x400 SubViewport sizing and quad texture identity.
- test_ball.gd observes a natural left-paddle rebound (speed88, normalized
  direction), then creates a fresh scene and moves the paddle away with W.
  A missed ball resets to(300,200), speed80, leftward direction.
- test_rally.gd is an automated state-feedback controller sending real key
  events. No ball/paddle assignments, direct process calls or time scaling.
  Its30-second bound may leave random trajectory coverage incomplete. See
  FRICTIONAL.md for observed coverage and failures; do not present as human play.

Local runtime change: post-integration center clamps prevent paddle overshoot.
This intentionally retains the original center0..400 convention, not whole
sprite containment. Upstream assets, scripts and license remain preserved in
the original demo checkout. Title changed in this independent adaptation.

## Evidence still required before films

Actual GPU pixels showing the live2D game on the3D quad, readable presentation,
camera idle appearance, inspection of final native4K frames, narration and
regular outro. A bound texture object does not establish visible output.
Record actual inputs at original gameplay speed and keep logs with capture.
No paid APIs, fabricated gameplay or substituted unit-test animation.

The shared visible-recording blocker remains. No new windows until resolved;
both films stay pending. May inspect the next feasible source while blocked,
without marking this demo or earlier demos complete or retired.
