class_name CrossingEvaluation
extends RefCounted

# Classifies observed events, never speed alone or a mandatory stop at an empty crossing.
static func evaluate(events: Array, completed: bool, source_checked: bool) -> Dictionary:
	if not source_checked or not completed or events.is_empty():
		return _result("not_assessed", "Ikke vurdert", "Situasjonen ble ikke fullført med tilstrekkelig datagrunnlag.", "Prøv situasjonen på nytt.")
	var late := false
	for event in events:
		if event.get("type") == "collision":
			return _result("serious", "Kollisjon ved gangfeltet", "Bilen traff fotgjengeren.", "Reduser farten tidligere og gi fotgjengeren rom til å krysse.")
		if event.get("type") == "pedestrian_obstructed":
			return _result("serious", "Fotgjengeren måtte vente", "Bilen sperret fotgjengerens vei under kryssingen.", "Vent før gangfeltet til du kan passere uten å hindre den gående.")
		if event.get("type") in ["late_brake", "stopped_on_crossing"]:
			late = true
	if late:
		return _result("improve", "Øv på tidligere fartstilpasning", "Bremsingen eller stansepunktet ga liten margin ved gangfeltet.", "Slipp gassen tidligere og planlegg stans før oppmerkingen.")
	return _result("good", "God samhandling", "Du passerte uten å hindre eller treffe fotgjengeren.", "Ta med deg den rolige tilnærmingen til neste situasjon.")

static func _result(outcome: String, title: String, observation: String, advice: String) -> Dictionary:
	return {"outcome": outcome, "title": title, "observation": observation, "advice": advice}
