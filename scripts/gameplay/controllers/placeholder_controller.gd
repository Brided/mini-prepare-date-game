extends Node2D
class_name PlaceholderController

signal finished

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				ScenesGlobal.start_action_timer()
				emit_signal("finished")
