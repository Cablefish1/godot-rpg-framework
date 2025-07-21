extends Node
class_name Health

signal died

@export var max_hit_points : int = 0
@export var hit_points : int = 0

@export_category("health calculation variables")
@export var calculate_health_on : bool = true
@export var hp_per_level : int = 8
@export var level : int = 1


@export var vulnurabilities : Array[String] = []
@export var resistances : Array[String] = []
@export var immunities : Array[String] = []



func _ready() -> void:
	if calculate_health_on == true:
		calculate_health()

func calculate_health():
	var statblock = get_node_or_null("../StatBlock")
	var hp_modifier = 0
	if statblock != null:
		hp_modifier = statblock.get_modifier("constitution")
		print("HP modifier "+str(hp_modifier))
	max_hit_points = (hp_modifier + hp_per_level) * level
	hit_points = max_hit_points
	print("HP = "+str(hit_points))
	


func take_damage(amount : int, type : String = ""):
	if vulnurabilities.has(type):
		hit_points = hit_points - (amount * 2)
	if immunities.has(type):
		return
	if resistances.has(type):
		hit_points = hit_points - floor(amount / 2)
	else:
		hit_points = hit_points - amount
	print("Target took "+str(amount)+" "+type+" damage")
	print(str(hit_points)+" Hit Points left")
	if hit_points <= 0:
		push_warning("Target is dead!")
		emit_signal("died")

func NPC_attacked():
	print("initiate combat logic")


func get_interactions() -> Array:
	if get_parent().entity_type == "NPC": #target is alive
		return [{
			"name" : "Attack",
			"callback" : Callable(self, "NPC_attacked"),
			"arguments": [],
			"enabled" : true
		}]
	else: #target is inanimatebut can be hurt
		return [{
			"name" : "Bash",
			"callback" : Callable(self, "take_damage"),
			"arguments": [5, "Normal"],
			"enabled" : true
		},
		{
			"name" : "Burn",
			"callback" : Callable(self, "take_damage"),
			"arguments": [2, "Fire"],
			"enabled" : true
		}]
	
