extends Node2D
class_name CalendarController

signal finished

@onready var label = $Label

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton and event.pressed:
		ScenesGlobal.start_action_timer()
		emit_signal("finished")

func _ready():
	label.text = "Hi"
	
	match ScenesGlobal.current_level_index:
		1:
			label.text = "Day -3: Evening Message"
		2:
			label.text = "Day -2: Shopping"
		3:
			label.text = "Day -1: Preparations"
		4:
			label.text = "Day J: The Big day"
		_:
			pass
