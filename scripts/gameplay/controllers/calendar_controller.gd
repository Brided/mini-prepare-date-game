extends Node2D
class_name CalendarController

signal finished

@onready var label = $Label

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				ScenesGlobal.start_action_timer()
				emit_signal("finished")

func _ready():
	label.text = "Hi"
	
	match ScenesGlobal.current_level_index:
		1:
			label.text = "Day -3:\nEvening Message"
		2:
			label.text = "Day -2:\nShopping"
		3:
			label.text = "Day -1:\nPreparations"
		4:
			label.text = "Day J:\nThe Big day"
		_:
			pass
