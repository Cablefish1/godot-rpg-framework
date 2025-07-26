extends Node2D

class_name PartySlots



func place_members(members: Array[Node]) -> void:
	# members should be in the same order as your slots (0…3)
	for i in members.size():
		var  member = members[i]
		var slot = get_child(i)
		slot.add_child(member)
		member.global_position = slot.global_position
