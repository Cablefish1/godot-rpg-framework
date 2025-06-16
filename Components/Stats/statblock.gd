extends Node
class_name StatBlock


@export_category("Stats")
@export var strength : int = 12
@export var perception : int = 10
@export var constitution : int = 10
@export var agility : int = 10
@export var intelligence : int = 10 
@export var charisma : int = 10


func get_modifier(stat: String) -> int:
	match stat:
		"strength": return floor(strength - 10) / 2
		"perception" : return floor(perception - 10) / 2
		"constitution" : return floor(constitution - 10) / 2
		"agility" : return floor(agility - 10) / 2
		"intelligence" : return floor(intelligence - 10) / 2
		"charisma" : return floor(charisma -10) / 2
		_: 
			push_warning("Unknown stat: %s" %stat)
			return 0
		
