extends Node2D
# Scene 3

func load_next_scene():
	get_tree().change_scene_to_file(ScenesGlobal.day_j)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		load_next_scene()
