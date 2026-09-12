extends SceneTree
var failures := 0
func expect(condition: bool, message: String) -> void:
	if not condition:
		failures += 1
		push_error(message)
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var world = load("res://scenes/game/crossing.tscn").instantiate()
	root.add_child(world)
	await physics_frame
	var s = world.scenario
	var c = world.car
	c.controls_enabled = false
	c.position = Vector2(36,190)
	c.speed_mps = 1
	await physics_frame
	expect(s.phase == "active", "Crossing entry activates scenario")
	paused = true
	var before: Vector2 = s.person
	var time_before: float = s.simulation_time
	for i in range(4):
		await physics_frame
	expect(s.person == before and s.simulation_time == time_before, "Pause freezes actors and simulation clock")
	paused = false
	s.person = c.position
	await physics_frame
	await physics_frame
	expect(s.seen.has("collision") and s.phase == "completed", "Physical overlap records collision and freezes attempt")
	var old_attempt: int = s.attempt
	s.reset_scenario()
	expect(s.events.is_empty() and s.phase == "ready" and s.attempt == old_attempt + 1, "Retry clears events and creates new attempt")
	expect(s.person == s.PERSON_START and c.position == Vector2(36,400), "Retry restores all actors")
	c.controls_enabled = false
	c.position = Vector2(36,190)
	c.speed_mps = 1
	await physics_frame
	await physics_frame
	c.position = Vector2(200,0)
	await physics_frame
	await physics_frame
	expect(s.phase == "aborted" and s.result.outcome == "not_assessed", "Wrong route aborts without mastery")
	world.queue_free()
	await process_frame
	print("Crossing runtime: ", "PASS" if failures == 0 else "FAIL", " (",failures," failures)")
	quit(1 if failures else 0)
