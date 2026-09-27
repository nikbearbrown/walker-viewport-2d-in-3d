# Open questions log — walker-viewport-2d-in-3d

gate — unsigned at time of writing

Zelda (agent, silent) for Nik Bear Brown · 2026-09-27 · recovered revision 1.

Format per entry: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS.
Status is Open, In Discussion, or Decided. Decided items move into their section before the next session.

Every `[MISSING]` in `design/GDD.md` is one row below. Count: 14 open.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | Why is this demo in Walker, and what should it teach or prove? (GDD §1) | Without it nobody can say when the folder is done; Ghost Center | before any further work on this folder | (a) teaching example of render-to-texture; (b) film subject only; (c) regression fixture for the Walker pipeline | Nik Bear Brown | Open |
| Q-02 | Who is the audience? (§1) | Decides whether the films explain the technique or show off the result | before film script | students new to Godot / Godot users / general viewers | Nik Bear Brown | Open |
| Q-03 | What are the design pillars? (§2) | No yardstick for rejecting changes | with Q-01 | adopt the three inferred candidates in §2 / write new ones / none (demo) | Nik Bear Brown | Open |
| Q-04 | What should a viewer or player feel or understand? (§4) | No PX goal means no test for whether the demo worked on a person | with Q-01 | "the 2D game is live on a 3D surface" / none (pure technique) | Nik Bear Brown | Open |
| Q-05 | Should Pong keep score or end? (§3) | Scope creep vs a demo that reads as a game | before any Pong change | (a) no score, as upstream; (b) score display only; (c) first-to-N | Nik Bear Brown | Open |
| Q-06 | Is unbounded ×1.1 ball speed intended? (§5 M-03, R-02) | Likely paddle tunnelling after ~19 hits | before T-05 | (a) keep upstream; (b) cap speed; (c) swept collision | Nik Bear Brown | Open |
| Q-07 | Paddle containment: keep centre 0..400, or keep the whole sprite on screen? (§5 M-05) | Half a paddle can leave the screen; ratifies the local clamp | before film capture | (a) centre bound, as now; (b) half-sprite inset | Nik Bear Brown | Open |
| Q-08 | Camera idle uses `camera_base_rotation.y` for all three axes. Keep or fix? (§5 M-06, R-05) | Invisible today; wrong the moment the camera is rotated | before any camera change | (a) keep upstream quirk; (b) use each axis's own base | Nik Bear Brown | Open |
| Q-09 | Approve feature priorities; CORE is 4/8 = 50%, over 40%. Cut or extend? (§11) | Rule overage; what the MVP is | now | (1) demote F-04 Pong rules to IMPORTANT, reduced MVP = technique only (37.5%); (2) keep all four CORE and extend the timeline / accept the overage | Nik Bear Brown | Open |
| Q-10 | What must the two planned 4K films show, and who accepts them? (§13) | Film work has no acceptance line beyond `VERIFICATION.md:23-27` | before film script | adopt `VERIFICATION.md` list as acceptance / add explicit shots and runtime | Nik Bear Brown | Open |
| Q-11 | What clears the shared visible-recording blocker so pixels can be checked? (§14 R-01) | The demo's only claim stays unverified | now | (a) dedicated capture machine; (b) offscreen GPU readback (T-04); (c) human screen recording | Nik Bear Brown | Open |
| Q-12 | Should input on the 3D quad (mouse/touch) be forwarded into the SubViewport? (§12) | Natural next feature; changes scope | before any new feature | out of scope / in scope as F-09 | Nik Bear Brown | Open |
| Q-13 | Is there a timeline or deadline? (§11) | Needed to choose between Q-09 options | now | date / "no date, background item" | Nik Bear Brown | Open |
| Q-14 | Stay minimal-diff from upstream, or fix upstream quirks locally? (§13) | Governs Q-06 and Q-08, and future re-syncs | before Q-06/Q-08 | (a) minimal diff; (b) fix locally, document each diff | Nik Bear Brown | Open |
