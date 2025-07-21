extends Entity

class_name PartyCharacter


func _on_portrait_button_pressed() -> void:
	global_party_controller.select_PC(self)

func has_skill(skill_name : int):
	var skillbook = get_component("Skillbook").skills[skill_name]
