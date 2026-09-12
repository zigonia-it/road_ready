extends "res://scripts/training.gd"

const Scenario = preload("res://scripts/scenarios/crossing.gd")
var scenario: CrossingScenario
var feedback: Label

func _ready() -> void:
	super._ready()
	# Replace the generic exercise obstacle with the crossing road geometry.
	for child in get_children():
		if child is StaticBody2D:
			child.queue_free()
	car.position = Vector2(36,400)
	car.start_transform = car.transform
	scenario = Scenario.new()
	scenario.car = car
	scenario.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(scenario)
	scenario.finished.connect(_show_result)
	var layer := CanvasLayer.new()
	add_child(layer)
	feedback = Label.new()
	feedback.position = Vector2(24,90)
	feedback.add_theme_font_size_override("font_size", 20)
	layer.add_child(feedback)
	feedback.text = "Kjør rett fram gjennom gangfeltet. Følg med på den gående.\nBackspace starter hele situasjonen på nytt."

func _process(delta: float) -> void:
	super._process(delta)
	if Input.is_action_just_pressed("reset_vehicle") and not get_tree().paused:
		scenario.reset_scenario()
		feedback.text = "Nytt forsøk · Kjør rett fram og følg med på fotgjengeren."

func _show_result(value: Dictionary) -> void:
	feedback.text = "%s\n%s\n%s\n\nBackspace: prøv igjen" % [value.title, value.observation, value.advice]

func _draw() -> void:
	draw_rect(Rect2(-600,-1100,1200,2000), Color("7f9971"))
	draw_rect(Rect2(-115,-1100,230,2000), Color("c4c3ab"))
	draw_rect(Rect2(-84,-1100,168,2000), Color("535e61"))
	for y in range(-1000,850,100):
		if absf(y + 240) > 75:
			draw_rect(Rect2(-2,y,4,38), Color("e9dd93"))
