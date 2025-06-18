extends Node2D
class_name Entity


@export var entity_name : String = ""






#chatgpt's script! Gotta test if it works!

func get_component(component_class_name: String) -> Node:
	for child in get_children():
		if child.get_class() == component_class_name:
			return child
	print_debug("Component '%s' not found on entity %s" % [component_class_name, name])
	return null

#Der skal laves to funktioner mere.
# call_components der fyrer signals til alle componenter der er interesseret i dem.
# has_component der tester om en entity har en component til brug.

# Scriptet her skal lave en context-meny.
# Jeg tænker lidt at dele den op mellem skills der kan bruges, ting man kan kan gøre med NPC'er osv så context menu bliver lidt organiseret.
func build_context_menu() -> Array:
	var menu_options : = []
	for component in get_children():
		if component.has_method("get_actions"):
			menu_options += component.get_interactions()
	if menu_options == []:
		push_error("No Interactions Possible")
	
	return menu_options
	
