class_name CrossingScenario
extends Node2D

signal finished(result: Dictionary)
const Evaluation = preload("res://scripts/evaluation/crossing_evaluation.gd")
const CROSSING_Y := -240.0
const START_Y := 200.0
const PERSON_START := Vector2(112, CROSSING_Y)
const PERSON_END_X := -112.0
const PERSON_SPEED := 16.8 # 1.4 metres/second.
var car: PlayerVehicle
var phase := "ready"
var attempt := 0
var simulation_time := 0.0
var person := PERSON_START
var events: Array = []
var result: Dictionary = {}
var seen: Dictionary = {}
var previous_speed := 0.0
var person_enabled := true
var source_checked := false

func _ready() -> void:
	var definition = JSON.parse_string(FileAccess.get_file_as_string("res://data/scenarios/crossing_01.json"))
	if definition is Dictionary:
		source_checked = definition.get("assessment_enabled", false)
	reset_scenario()

func reset_scenario() -> void:
	attempt += 1
	phase = "ready"
	simulation_time = 0.0
	person = PERSON_START
	events.clear()
	seen.clear()
	result.clear()
	previous_speed = 0.0
	if is_instance_valid(car):
		car.reset_vehicle()
		car.controls_enabled = true
	queue_redraw()

func _physics_process(delta: float) -> void:
	if not is_instance_valid(car) or phase in ["completed", "aborted"]:
		return
	if phase == "ready":
		if car.position.y <= START_Y and car.position.y > CROSSING_Y and car.speed_mps > 0:
			phase = "active"
			_record("started")
		else:
			return
	simulation_time += delta
	if absf(car.position.x) > 85 or car.position.y > START_Y + 100:
		phase = "aborted"
		_record("aborted")
		_finish(false)
		return
	var local_person := car.to_local(person)
	if person_enabled and absf(local_person.x) < 18 and absf(local_person.y) < 31:
		_record("collision")
		_finish(true)
		return
	var on_crossing := absf(car.position.y - CROSSING_Y) < 48
	var approaching_person := person.x > car.position.x and person.x - car.position.x < 45
	if person_enabled and on_crossing and approaching_person:
		_record("pedestrian_obstructed")
	else:
		person.x = maxf(PERSON_END_X, person.x - PERSON_SPEED * delta)
	if on_crossing and absf(car.speed_mps) < 0.15:
		_record("stopped_on_crossing")
	var distance := (car.position.y - 24 - (CROSSING_Y + 24)) / 12.0
	var deceleration := (previous_speed - absf(car.speed_mps)) / delta
	# Pedagogical threshold only, not a legal deceleration limit.
	if person_enabled and person.x > car.position.x - 25 and distance > 0 and distance < 8 and deceleration > 5.5:
		_record("late_brake")
	previous_speed = absf(car.speed_mps)
	if car.position.y + 24 < CROSSING_Y - 24 and car.speed_mps > 0:
		_record("passed")
		_finish(true)
	queue_redraw()

func _record(kind: String) -> void:
	if seen.has(kind):
		return
	seen[kind] = true
	events.append({"type":kind, "scenario_id":"crossing_01", "attempt":attempt, "actor_id":"player", "time":simulation_time, "player_position":car.position, "pedestrian_position":person, "speed_mps":car.speed_mps})

func _finish(completed: bool) -> void:
	phase = "completed" if completed else "aborted"
	car.controls_enabled = false
	car.velocity = Vector2.ZERO
	result = Evaluation.evaluate(events, completed, source_checked)
	finished.emit(result)
	queue_redraw()

func _draw() -> void:
	for x in range(-72,73,24):
		draw_rect(Rect2(x, CROSSING_Y - 24, 12, 48), Color("eee8cd"))
	if person_enabled:
		draw_circle(person + Vector2(2,3), 9, Color("253f36"))
		draw_rect(Rect2(person + Vector2(-6,-6), Vector2(12,14)), Color("d37651"))
		draw_circle(person + Vector2(0,-8), 5, Color("e7ba8c"))
