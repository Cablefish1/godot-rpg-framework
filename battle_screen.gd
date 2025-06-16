extends Control


func _on_button_pressed() -> void:
	var target = find_child("Player")
	if target == null:
		push_error("Nonexisting target!")
		return
	target.take_damage(2, "fire")
	
