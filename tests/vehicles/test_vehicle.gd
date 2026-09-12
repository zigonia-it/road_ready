extends SceneTree

const Vehicle = preload("res://scripts/vehicles/vehicle.gd")
var failures := 0

func _initialize() -> void:
	call_deferred("run")

func check(condition: bool, message: String) -> void:
	if not condition:
		failures += 1
		push_error(message)

func run() -> void:
	var car := Vehicle.new()
	car.controls_enabled = false
	root.add_child(car)
	await physics_frame
	for i in range(120):
		car.step(1.0/60.0, 1, 0, 0)
	check(absf(car.speed_mps - 6.0) < 0.01, "Two seconds at 3 m/s² must reach 6 m/s")
	check(car.position.y < 0, "Forward movement must face north")
	for i in range(60):
		car.step(1.0/60.0, 0, 1, 0)
	check(car.speed_mps == 0, "Brake must stop without reversing")
	car.reverse_gear = true
	var old_y := car.position.y
	for i in range(60):
		car.step(1.0/60.0, 1, 0, 0)
	check(car.position.y > old_y, "Reverse gear must move backward")
	car.indicator = 1
	car.reset_vehicle()
	check(car.position == Vector2.ZERO and car.speed_mps == 0 and car.indicator == 0 and not car.reverse_gear, "Reset must restore complete driving state")
	for i in range(600):
		car.step(1.0/60.0, 1, 0, 0)
	check(car.speed_mps <= 50.0/3.6 + 0.001, "Forward speed must be capped at 50 km/h")
	car.reset_vehicle()
	for i in range(60):
		car.step(1.0/60.0, 0, 0, 1)
	check(car.rotation == 0, "Stationary steering must not rotate the car")
	car.queue_free()
	await process_frame
	print("Vehicle checks: ", "PASS" if failures == 0 else "FAIL", " (", failures, " failures)")
	quit(1 if failures else 0)
