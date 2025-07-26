extends Node


@export var enemy_scene_paths : Array[String] = [
	
]

func get_interactions():
	var selected_PC = global_party_controller.get_selected_entity()
	if selected_PC == null:
		push_error("No PC selected")
		return []
	return [{
			"name" : "Engage",
			"callback" : Callable(self, "start_battle"),
			"arguments": [],
			"enabled" : true
		}]
	
func start_battle():
	game_state.start_battle()
