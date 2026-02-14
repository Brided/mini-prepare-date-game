extends Node2D
# Scene 2

func load_next_scene():
	get_tree().change_scene_to_file(ScenesGlobal.day_3)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		load_next_scene()
