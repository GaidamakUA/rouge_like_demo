extends Area2D

class_name ActionProvider

onready var door: Door = get_parent()

var actor = null

func _on_actor_entered(shape: Area2D):
	if not shape is Actor:
		return

	actor = shape
	_update_actions()

func _on_ActionsProvider_area_exited(area):
	print("_on_ActionsProvider_area_exited")
	if actor == area:
		actor = null
	
func _update_actions():
	if actor:
		if door.opened:
			actor.set_possible_actions([$Close])
		else:
			actor.set_possible_actions([$Open])
