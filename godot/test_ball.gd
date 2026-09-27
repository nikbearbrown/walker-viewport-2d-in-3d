extends "res://test_input.gd"

func run_probe() -> void:
	change_scene_to_file("res://2d_in_3d.tscn")
	await process_frame
	await process_frame
	var pong := current_scene.get_node("SubViewport/Pong")
	var deadline := Time.get_ticks_msec() + 5000
	var bounce := false
	while Time.get_ticks_msec() < deadline:
		if pong.direction.x > 0:
			bounce = is_equal_approx(pong.ball_speed, 88.0) and is_equal_approx(pong.direction.length(), 1.0)
			break
		await process_frame
	print("NATURAL_LEFT_PADDLE_BOUNCE=", bounce, " SPEED=", pong.ball_speed)
	# Start a fresh normal scene; move the paddle away with a real key hold.
	change_scene_to_file("res://2d_in_3d.tscn")
	await process_frame
	await process_frame
	pong = current_scene.get_node("SubViewport/Pong")
	key(KEY_W, true)
	await create_timer(1.5).timeout
	key(KEY_W, false)
	deadline = Time.get_ticks_msec() + 4000
	var reset_seen := false
	var previous_x: float = pong.ball.position.x
	while Time.get_ticks_msec() < deadline:
		await process_frame
		var x: float = pong.ball.position.x
		if previous_x < 10 and x > 290:
			reset_seen = pong.ball.position.is_equal_approx(Vector2(300, 200)) and is_equal_approx(pong.ball_speed, 80) and pong.direction == Vector2.LEFT
			break
		previous_x = x
	print("INPUT_DRIVEN_MISS_RESET=", reset_seen, " BALL=", pong.ball.position)
	current_scene.queue_free()
	await process_frame
	await process_frame
	quit(0 if bounce and reset_seen else 1)
