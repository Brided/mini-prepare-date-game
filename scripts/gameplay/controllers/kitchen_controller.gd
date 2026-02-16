extends Node
class_name KitchenController

signal finished

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton and event.pressed:
		ScenesGlobal.start_action_timer()
		emit_signal("finished")
