extends Node2D
class_name BuildingController

signal building_window_clicked

@onready var camera = $Camera2D
@onready var animation_player = $AnimationPlayer

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("building_window_clicked")

func zoom_in_on_window():
	animation_player.play("camera_zoom_in")

func zoom_out_from_window():
	animation_player.play_backwards("camera_zoom_in")

func _ready():
	camera.enabled = true
