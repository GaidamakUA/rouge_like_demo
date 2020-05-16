tool
extends StaticBody2D

class_name Door

export(bool) var opened setget set_opened

onready var door_opened = $DoorOpened
onready var door_closed = $DoorClosed
onready var collision_shape= $CollisionShape2D

var is_ready := false

func _ready():
	is_ready = true

func set_opened(value: bool):
	print("set_opened:", value)
	opened = value
	if not is_ready:
		yield(self, "ready")
		
	$CollisionShape2D.disabled = opened
	door_opened.visible = opened
	door_closed.visible = not opened
	
	$ActionsProvider._update_actions()

func get_actions() -> Array:
	if opened:
		return [$Actions/Close]
	else:
		return [$Actions/Open]
