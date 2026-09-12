class_name PlayerVehicle
extends CharacterBody2D

# World scale: 12 pixels = 1 metre. All speeds and acceleration use SI units.
const PIXELS_PER_METRE := 12.0
const MAX_SPEED := 50.0 / 3.6
const REVERSE_SPEED := 12.0 / 3.6
const ACCELERATION := 3.0
const BRAKING := 7.0
const DRAG := 0.5
const WHEELBASE := 2.6

var speed_mps := 0.0
var reverse_gear := false
var indicator := 0
var elapsed := 0.0
var controls_enabled := true
var start_transform := Transform2D.IDENTITY

func _ready() -> void:
	var shape := CollisionShape2D.new()
	var rectangle := RectangleShape2D.new()
	rectangle.size = Vector2(22, 48)
	shape.shape = rectangle
	add_child(shape)
	start_transform = transform

func _physics_process(delta: float) -> void:
	elapsed += delta
	if controls_enabled:
		if Input.is_action_just_pressed("reverse") and absf(speed_mps) < 0.15:
			reverse_gear = not reverse_gear
		if Input.is_action_just_pressed("left_indicator"):
			indicator = 0 if indicator == -1 else -1
		if Input.is_action_just_pressed("right_indicator"):
			indicator = 0 if indicator == 1 else 1
		if Input.is_action_just_pressed("reset_vehicle"):
			reset_vehicle()
		step(delta, Input.get_action_strength("accelerate"), Input.get_action_strength("brake"), Input.get_axis("steer_left", "steer_right"), Input.is_action_pressed("handbrake"))
	queue_redraw()

func step(delta: float, throttle: float, brake: float, steer: float, handbrake := false) -> void:
	var direction := -1.0 if reverse_gear else 1.0
	if brake > 0.0 or handbrake:
		speed_mps = move_toward(speed_mps, 0.0, BRAKING * maxf(brake, 1.0 if handbrake else 0.0) * delta)
	elif throttle > 0.0:
		var target := -REVERSE_SPEED if reverse_gear else MAX_SPEED
		speed_mps = move_toward(speed_mps, target, ACCELERATION * throttle * delta)
	else:
		speed_mps = move_toward(speed_mps, 0.0, DRAG * delta)
	var steering_angle := steer * lerpf(0.55, 0.28, absf(speed_mps) / MAX_SPEED)
	rotation += (speed_mps / WHEELBASE) * tan(steering_angle) * delta
	velocity = Vector2.UP.rotated(rotation) * absf(speed_mps) * direction * PIXELS_PER_METRE
	move_and_slide()
	if get_slide_collision_count() > 0:
		speed_mps = 0.0

func reset_vehicle() -> void:
	transform = start_transform
	speed_mps = 0.0
	velocity = Vector2.ZERO
	reverse_gear = false
	indicator = 0
	elapsed = 0.0

func _draw() -> void:
	for wheel in [Rect2(-15,-16,5,12), Rect2(10,-16,5,12), Rect2(-15,10,5,12), Rect2(10,10,5,12)]:
		draw_rect(wheel, Color("172829"))
	draw_rect(Rect2(-12,-25,24,50), Color("152e31"))
	draw_rect(Rect2(-10,-23,20,46), Color("e6ac42"))
	draw_rect(Rect2(-8,-12,16,10), Color("8bbab4"))
	draw_rect(Rect2(-8,10,16,7), Color("44676b"))
	draw_rect(Rect2(-8,-22,5,3), Color("fff3bf"))
	draw_rect(Rect2(3,-22,5,3), Color("fff3bf"))
	if indicator != 0 and fmod(elapsed, 0.8) < 0.4:
		for y in [-19, 19]:
			draw_rect(Rect2(indicator * 12 - 2, y, 4, 4), Color("ffdf64"))
