extends Node2D

export(Vector2) var tile_size := Vector2(64, 64)

onready var raycast: RayCast2D = $CollisionRayCast

signal actions_available

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		_move_if_possible(Vector2.UP)
	if event.is_action_pressed("ui_down"):
		_move_if_possible(Vector2.DOWN)
	if event.is_action_pressed("ui_left"):
		_move_if_possible(Vector2.LEFT)
	if event.is_action_pressed("ui_right"):
		_move_if_possible(Vector2.RIGHT)
	if event.is_action_pressed("clockwise"):
		_rotate(PI / 2)
	if event.is_action_pressed("couterclockwise"):
		_rotate(-PI / 2)

func _rotate(radians):
	rotate(radians)
	emit_signal("actions_available", [])

func _move_if_possible(direction: Vector2):
	look_at(position + direction)
	raycast.force_raycast_update()
#
	if not raycast.is_colliding():
		move_local_x(tile_size.x)
		emit_signal("actions_available", [])
	else:
		print(raycast.get_collider())

func set_possible_actions(actions: Array):
	emit_signal("actions_available", actions)
