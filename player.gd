extends Node2D
class_name Player

@onready var health_component : Node




func _ready() -> void:
	var statblock = get_node_or_null("StatBlock")
	var modifier = statblock.get_modifier("strength")
	health_component = get_node_or_null("Health")
	print("Modifier is "+str(modifier))
