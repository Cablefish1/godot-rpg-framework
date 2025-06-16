extends Node
class_name StatBlock


@export_category("Stats")
@export var strength : int = 2
@export var perception : int = 0
@export var constitution : int = 0
@export var agility : int = 0
@export var intelligence : int = 0 
@export var charisma : int = 0


func get_modifier(stat: String) -> int:
	match stat:
		"strength": return floor(strength / 2)
		"perception" : return floor(perception / 2)
		"constitution" : return floor(constitution / 2)
		"agility" : return floor(agility / 2)
		"intelligence" : return floor(intelligence / 2)
		"charisma" : return floor(charisma / 2)
		_: 
			push_warning("Unknown stat: %s" %stat)
			return 0
		
