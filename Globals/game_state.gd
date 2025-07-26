extends Node

class_name GameState


func start_battle():
	print("Battle Begins!")
	var battle_scene = preload("res://UI/Game Screens/battle.tscn")
	var battle = battle_scene.instantiate()

	battle.party_members.duplicate(true)
	
	# 1) instance your Battle scene
	var battle_scene = preload("res://Battle.tscn")
	var battle = battle_scene.instantiate()
	# 2) collect current party members
	battle.party_members = PartyController.party_members.duplicate(true)
	# 3) instance enemies
	battle.enemies = []
	for path in enemy_paths:
		var en = preload(path).instantiate()
		battle.enemies.append(en)
	# 4) switch scenes
	get_tree().root.clear()     # or however you clear the map
	get_tree().root.add_child(battle)
