extends Node2D
class_name Entity


@export var entity_name : String = ""

@export var entity_type : String = ""




#chatgpt's script! Gotta test if it works!

func get_component(component_group: String) -> Node:
	print(get_children())
	for child in get_children():
		if child.is_in_group(component_group):
			print(child)
			return child
	print_debug("Component '%s' not found on entity %s" % [component_group, name])
	return null

#Der skal laves to funktioner mere.
# call_components der fyrer signals til alle componenter der er interesseret i dem.
# has_component der tester om en entity har en component til brug.

# Scriptet her skal lave en context-meny.
# Jeg tænker lidt at dele den op mellem skills der kan bruges, ting man kan kan gøre med NPC'er osv så context menu bliver lidt organiseret.
func build_menu_options():
	print("building context menu")
	var menu_options : = []
	for component in get_children():
		if component.has_method("get_interactions"):
			menu_options += component.get_interactions()
			#DEBUG print("Found interaction:"+str(menu_options))
	if menu_options == []:
		push_error("No Interactions Possible") #replace with in-game UI
		return
	$"../ContextMenu".show_menu(menu_options)



	
