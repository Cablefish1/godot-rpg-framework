extends Button

class_name Interactable

signal request_context_menu(options)

func _ready():
	set_text(get_parent().entity_name)


	
func _on_pressed():
	print("interactable pressed")
	emit_signal("request_context_menu", get_parent().build_menu_options())


func _on_request_context_menu(options: Variant) -> void:
	pass # Replace with function body.
