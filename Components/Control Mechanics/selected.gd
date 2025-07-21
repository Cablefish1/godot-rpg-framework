extends Node

class_name Selected


signal became_selected()
signal became_deselected()

func _ready():
	add_to_group("Selected")

func select():
	print(str(get_parent())+" became seleced")
	$"../SelectColor".modulate = Color(1,1,1,1)
	emit_signal("became_selected")
	

func deselect():
	emit_signal("became_deselected")
