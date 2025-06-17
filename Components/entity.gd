extends Node2D
class_name Entity


#chatgpt's script! Gotta test if it works!





func get_component(type_name: String) -> Node:
	for child in get_children():
		if child.get_class() == type_name:
			return child
	return null
	
#func get_component(type_ref) -> Node:
#	for child in get_children():
#		if child is type_ref:
#			return child
#	print_debug("Component '%s' not found on entity %s" % [component_class, name])
#	return null
