extends Node2D
class_name InsideController

signal clicked

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked")
