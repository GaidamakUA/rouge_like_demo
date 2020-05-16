extends Node

class_name Action

signal action_performed

export(String) var description := "Lorem ipsum"

func perform():
	emit_signal("action_performed")

func _to_string():
	return "{ Action: " + description + " }"
