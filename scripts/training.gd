extends Node2D

const Vehicle = preload("res://scripts/vehicles/vehicle.gd")
var car: PlayerVehicle
var readout: Label

func _ready() -> void:
	_bind("accelerate", [KEY_W, KEY_UP])
	_bind("brake", [KEY_S, KEY_DOWN])
	_bind("steer_left", [KEY_A, KEY_LEFT])
	_bind("steer_right", [KEY_D, KEY_RIGHT])
	_bind("reverse", [KEY_R])
	_bind("left_indicator", [KEY_Q])
	_bind("right_indicator", [KEY_E])
	_bind("handbrake", [KEY_SPACE])
	_bind("reset_vehicle", [KEY_BACKSPACE])
	_bind("pause", [KEY_ESCAPE])
	process_mode = Node.PROCESS_MODE_ALWAYS
	for wall in [Rect2(-720,-1000,20,1800), Rect2(700,-1000,20,1800), Rect2(-720,-1000,1440,20), Rect2(-720,780,1440,20), Rect2(-150,-500,300,80)]:
		var body := StaticBody2D.new()
		body.position = wall.get_center()
		var collider := CollisionShape2D.new()
		var rectangle := RectangleShape2D.new()
		rectangle.size = wall.size
		collider.shape = rectangle
		body.add_child(collider)
		add_child(body)
	car = Vehicle.new()
	car.position = Vector2(150, 400)
	car.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(car)
	var camera := Camera2D.new()
	camera.ignore_rotation = true
	camera.position = Vector2(0,-100)
	car.add_child(camera)
	var ui := CanvasLayer.new()
	add_child(ui)
	readout = Label.new()
	readout.position = Vector2(24,20)
	readout.add_theme_font_size_override("font_size", 22)
	ui.add_child(readout)
	var help := Label.new()
	help.position = Vector2(24,690)
	help.text = "ØVINGSPLASS · Teknisk kjøreprototype\nW/↑ gass   S/↓ brems   A/D styring   Q/E blinklys\nR gir D/R (stans først)   Mellomrom håndbrems   Backspace start på nytt   Esc pause"
	help.add_theme_font_size_override("font_size", 18)
	ui.add_child(help)

func _bind(action: String, keys: Array) -> void:
	if InputMap.has_action(action):
		return
	InputMap.add_action(action)
	for key in keys:
		var event := InputEventKey.new()
		event.physical_keycode = key
		InputMap.action_add_event(action, event)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
	readout.text = "%02d km/t   ·   %s   ·   %s%s" % [roundi(absf(car.speed_mps) * 3.6), "R" if car.reverse_gear else "D", "←" if car.indicator == -1 else ("→" if car.indicator == 1 else "Blinklys av"), "   PAUSE" if get_tree().paused else ""]

func _draw() -> void:
	draw_rect(Rect2(-720,-1000,1440,1800), Color("c9c9af"))
	draw_rect(Rect2(-700,-980,1400,1760), Color("545e60"))
	for x in range(-620,650,100):
		draw_line(Vector2(x,550), Vector2(x,740), Color("e6e2c4"), 3)
	draw_line(Vector2(-620,550), Vector2(650,550), Color("e6e2c4"), 3)
	for y in range(-850,450,100):
		draw_rect(Rect2(-3,y,6,44), Color("e6e2c4"))
	draw_rect(Rect2(-150,-500,300,80), Color("91a383"))
	draw_rect(Rect2(-150,-500,300,80), Color("c9c9af"), false, 8)
