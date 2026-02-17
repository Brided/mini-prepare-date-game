extends Node
class_name ArrangeFlowersController

signal finished

# Input handling

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	#escape
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		ScenesGlobal.start_action_timer()
		emit_signal("finished")

# Placeholder

func _on_finished():
	emit_signal("finished")
