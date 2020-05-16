extends ItemList

var actions: Array

func _on_Character_actions_available(actions: Array):
	self.actions = actions
	clear()
	for raw_action in actions:
		var action := raw_action as Action
		add_item(action.description)

func _on_ActionList_item_activated(index):
	print("_on_ActionList_item_activated")
	var action: Action = actions[index]
	action.perform()
