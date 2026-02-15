extends Node2D
# Scene 3

func load_next_scene():
	ScenesGlobal.load_next_day_scene()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		load_next_scene()
