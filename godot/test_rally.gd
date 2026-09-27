extends "res://test_input.gd"

# State-feedback input driver; never assigns ball/paddle state or retimes play.
func run_probe() -> void:
	change_scene_to_file("res://2d_in_3d.tscn")
	await process_frame
	await process_frame
	var pong := current_scene.get_node("SubViewport/Pong")
	var previous_direction: Vector2 = pong.direction
	var previous_position: Vector2 = pong.ball.position
	var right_bounce := false
	var roof_bounce := false
	var floor_bounce := false
	var deadline := Time.get_ticks_msec() + 30000
	while Time.get_ticks_msec() < deadline:
		for spec in [["LeftPaddle", KEY_W, KEY_S], ["RightPaddle", KEY_UP, KEY_DOWN]]:
			var dy: float = pong.ball.position.y - pong.get_node(spec[0]).position.y
			key(spec[1], dy < -3)
			key(spec[2], dy > 3)
		await process_frame
		var position: Vector2 = pong.ball.position
		var direction: Vector2 = pong.direction
		if previous_direction.x > 0 and direction.x < 0 and position.x > 560:
			right_bounce = true
		if previous_direction.y < 0 and direction.y > 0 and position.y < 2 and absf(position.x - previous_position.x) < 20:
			roof_bounce = true
		if previous_direction.y > 0 and direction.y < 0 and position.y > 398 and absf(position.x - previous_position.x) < 20:
			floor_bounce = true
		previous_direction = direction
		previous_position = position
		if right_bounce and roof_bounce and floor_bounce:
			break
	for code in [KEY_W, KEY_S, KEY_UP, KEY_DOWN]:
		key(code, false)
	print("INPUT_DRIVEN_RALLY right=", right_bounce, " roof=", roof_bounce, " floor=", floor_bounce)
	current_scene.queue_free()
	await process_frame
	await process_frame
	quit(0 if right_bounce and roof_bounce and floor_bounce else 1)
