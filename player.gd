extends Node2D
class_name Player



func _ready() -> void:
	var statblock = get_node_or_null("StatBlock")
	var modifier = statblock.get_modifier("strength")
	print("Modifier is "+str(modifier))
	var health = get_node_or_null("Health")


func take_damage(amount, damage_type):
	var health_component = find_child("Health")
	if health_component == null:
		push_error("Target has no health component")
		return
	health_component.take_damage(amount, damage_type)
