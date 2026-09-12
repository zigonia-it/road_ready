extends SceneTree
const Evaluation = preload("res://scripts/evaluation/crossing_evaluation.gd")
var failures := 0
func check(actual: String, expected: String, reason: String) -> void:
	if actual != expected:
		failures += 1
		push_error(reason + ": " + actual)
func _initialize() -> void:
	check(Evaluation.evaluate([{"type":"passed"}], true, true).outcome, "good", "Empty crossing must not require stopping")
	check(Evaluation.evaluate([{"type":"late_brake"},{"type":"passed"}], true, true).outcome, "improve", "Late braking is pedagogical feedback")
	check(Evaluation.evaluate([{"type":"collision"}], true, true).outcome, "serious", "Collision takes priority")
	check(Evaluation.evaluate([{"type":"pedestrian_obstructed"}], true, true).outcome, "serious", "Obstruction is not good handling")
	check(Evaluation.evaluate([{"type":"passed"}], false, true).outcome, "not_assessed", "Aborted attempt is not mastery")
	check(Evaluation.evaluate([{"type":"passed"}], true, false).outcome, "not_assessed", "Unverified rules are gated")
	check(Evaluation.evaluate([], true, true).outcome, "not_assessed", "Missing evidence is not mastery")
	print("Crossing evaluation: ", "PASS" if not failures else "FAIL")
	quit(1 if failures else 0)
