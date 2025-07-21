extends Node

class_name GlobalPartyController




var selected_PC : Entity = null


#i need to work on clearer naming conventions for my variables
func select_PC(PC : Entity):
	if selected_PC != null:
		selected_PC.get_component("Selected").deselect()
		selected_PC.get_component("Selected").queue_free()
	selected_PC = PC
	var select_component = Selected.new()
	PC.add_child(select_component)
	select_component.select()
	
#Dunno how to call this yet. Haven'ttested it!
func get_selected_entity() -> Node:
	var select_component = get_tree().get_first_node_in_group("Selected")
	if select_component == null:
		push_error("No party member selected!")
		return
	var selected_entity = select_component.get_parent()
	print("Fetching entity "+str(selected_entity))
	return selected_entity


func get_skill_or_null():
	get_selected_entity().get_node_or_null("Skillbook")
