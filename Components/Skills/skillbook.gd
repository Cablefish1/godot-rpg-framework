extends Node2D
class_name Skillbook



@export var skills : Dictionary = {
	"Lockpicking" : 3,
	"Spot" : 1,
	"Search" : 2
}

@onready var dicebag = Dicebag.new()

func roll_skill(skill_name : String, dificulty : int):
	var roll = dicebag.roll_dice(1, 20, skills[skill_name])
	if roll >= dificulty:
		return true
	else:
		return false
