extends SceneTree

var failures := 0
func check(condition: bool, message: String) -> void:
	if not condition:
		failures += 1
		push_error(message)

func _initialize() -> void:
	call_deferred("run")

func run() -> void:
	var world = load("res://scenes/game/training.tscn").instantiate()
	root.add_child(world)
	await physics_frame
	var car = world.car
	car.position = Vector2(0, -350)
	car.speed_mps = 50.0 / 3.6
	Input.action_press("accelerate")
	for i in range(120):
		await physics_frame
	Input.action_release("accelerate")
	check(car.position.y >= -396.1, "Car front must not cross obstacle at max speed")
	check(absf(car.speed_mps) < 0.1, "Collision must remove forward speed")
	car.reset_vehicle()
	Input.action_press("accelerate")
	for i in range(30):
		await physics_frame
	Input.action_release("accelerate")
	check(car.position.y < 400, "Mapped throttle must move the player")
	paused = true
	var before: Vector2 = car.position
	for i in range(10):
		await physics_frame
	check(car.position == before, "Paused world must freeze vehicle movement")
	paused = false
	world.queue_free()
	await process_frame
	print("Training integration: ", "PASS" if failures == 0 else "FAIL", " (", failures, " failures)")
	quit(1 if failures else 0)
