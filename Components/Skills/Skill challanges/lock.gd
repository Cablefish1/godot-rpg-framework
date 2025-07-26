extends Node

class_name Lock


const REQUIRED_SKILL : String = "Lockpicking"

@export var lock_strength : int = 10



func _ready():
	add_to_group("Lock")

func get_interactions() -> Array:
	var selected_PC = global_party_controller.get_selected_entity()
	if selected_PC == null:
		push_error("No PC selected")
		return []
	var selected_PC_skills = selected_PC.get_component("Skillbook")
	if selected_PC_skills.has_skill(REQUIRED_SKILL):
		return [{
			"name" : "Pick Lock",
			"callback" : Callable(self, "attempt_pick"),
			"arguments": [],
			"enabled" : true
		}]
	else:
		print("Selcted PC doesn't have lockpick skill")
		return []


func attempt_pick():
	var pc = global_party_controller.get_selected_entity()
	var skillbook = pc.get_component("Skillbook")
	var attempt = skillbook.roll_skill(REQUIRED_SKILL, lock_strength)
	var crit = attempt["critical"]
	if crit == "critical success":
		print("Critical succes")
	if crit == "critical fail":
		print("Lockpick broke") #and alerted opponents
	else:
		if attempt["value"] >= 0:
			print("Successful by %d" %attempt.value)
		else:
			print("Failed by %d" % - attempt.value)
		
	
