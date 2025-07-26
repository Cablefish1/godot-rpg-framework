extends Node
class_name Skillbook

@onready var dicebag = Dicebag.new()


func _ready():
	add_to_group("Skillbook")




@export var skills : Dictionary = {

}
#Sample skills
#	"Lockpicking" : 3,
#	"Spot" : 1,
#	"Search" : 2



func has_skill(skill_name : String) -> bool:
	return skill_name in skills #this is the tricky bit of code that returns true if the condition is met.

func get_skill_level(skill_name : String) -> int:
	if not skills.has(skill_name):
		push_error("Skill '%s' not found in skillbook" % skill_name)
	return skills.get(skill_name, 0) 




func roll_skill(skill_name : String, dificulty : int) -> Dictionary:
	var roll = dicebag.roll_dice(1, 20)
	var modifier = skills[skill_name]	
	var total = roll + modifier - dificulty
	print(roll)
	var crit : String = "NONE"
	if roll == 20:
		crit = "critical success"
	if roll == 1:
		crit = "critical fail"
	return {
		"value" : total,
		"critical" : crit,
		"roll" : roll,
		"modifier" : modifier
	}
