
# battle.gd
extends Control

class_name Battle

var party_members : Array
var enemies : Array

func _ready():
	# Called once when the scene is added to the tree.
	# You can now build your UI, draw your 2×2 grid, etc.
	setup_combatants()
	#draw_initial_UI() Commented out for later. Will have to contain health bars and so on
	
func setup_combatants():
	# Example: position party members at front/back rows
	for i in party_members.size():
		var party_character = party_members[i]
		add_child(party_character)            # instance passed-in PCs under this scene
		party_character.position = get_party_slot_position(i)
	# Same for enemies
	for j in enemies.size():
		var enemy = enemies[j]
		add_child(enemy)
		enemy.position = get_enemy_slot_position(j)
		
func get_party_slot_position(index: int) -> Vector2:
	var slot_names: = [
		"PartyFront1",
		"PartyFront2",
		"PartyBack1",
		"PartyBack2"
	]
	var slot_node = $PartySlots.get_node(slot_names[index])
	return slot_node.global_position
	
	
func get_enemy_slot_position(index: int) -> Vector2:
	var slot_names: = [
		"Enemy1",
		"Enemy2",
		"Enemy3",
		"Enemy4",
		"Enemy5",
		"Enemy6"
	]
	var slot_node = $EnemySlots.get_node(slot_names[index])
	return slot_node.global_position
	
	
