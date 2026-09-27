extends SceneTree

func _initialize() -> void:
	run_probe.call_deferred()

func key(code: Key, pressed: bool) -> void:
	var event := InputEventKey.new()
	event.physical_keycode = code
	event.keycode = code
	event.pressed = pressed
	Input.parse_input_event(event)

func run_probe() -> void:
	change_scene_to_file("res://2d_in_3d.tscn")
	await process_frame
	await process_frame
	var scene := current_scene
	var viewport: SubViewport = scene.get_node("SubViewport")
	var pong := viewport.get_node("Pong")
	var texture_bound: bool = scene.get_node("ViewportQuad").material_override.albedo_texture == viewport.get_texture()
	var dimensions_ok: bool = pong.screen_size == Vector2(600, 400)
	var all_inputs := true
	for sample in [[KEY_W, "LeftPaddle", -1], [KEY_S, "LeftPaddle", 1], [KEY_UP, "RightPaddle", -1], [KEY_DOWN, "RightPaddle", 1]]:
		var paddle: Sprite2D = pong.get_node(sample[1])
		var start_y := paddle.position.y
		key(sample[0], true)
		await create_timer(0.15).timeout
		key(sample[0], false)
		await process_frame
		var delta_y := paddle.position.y - start_y
		var passed: bool = delta_y * sample[2] > 1
		all_inputs = all_inputs and passed
		print("KEY=", sample[0], " DELTA_Y=", delta_y, " PASS=", passed)
	print("TEXTURE_BOUND=", texture_bound, " PONG_USES_SUBVIEWPORT_SIZE=", dimensions_ok)
	var bounds_ok := true
	for pair in [[KEY_W, KEY_UP], [KEY_S, KEY_DOWN]]:
		key(pair[0], true)
		key(pair[1], true)
		await create_timer(3.0).timeout
		key(pair[0], false)
		key(pair[1], false)
		for name in ["LeftPaddle", "RightPaddle"]:
			var paddle: Sprite2D = pong.get_node(name)
			var inside := paddle.position.y >= 0.0 and paddle.position.y <= 400.0
			bounds_ok = bounds_ok and inside
			print("BOUND_KEY=", pair[0], " PADDLE=", name, " Y=", paddle.position.y, " CENTER_IN_BOUNDS=", inside)
	scene.queue_free()
	await process_frame
	await process_frame
	quit(0 if all_inputs and texture_bound and dimensions_ok and bounds_ok else 1)
