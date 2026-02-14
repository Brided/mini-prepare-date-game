extends Node2D
# Scene J

func load_next_scene():
	get_tree().change_scene_to_file(ScenesGlobal.ending_scene)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		load_next_scene()
