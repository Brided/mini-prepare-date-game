extends Node2D
class_name BuildingController

signal finished

# TODO: Add title card before the steps listed here

@onready var camera = $Camera2D
@onready var animation_player = $AnimationPlayer

func _ready():
	current_step = 0
	camera.enabled = true

# Input handling

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			try_step("building_window_clicked")
			ScenesGlobal.start_action_timer()
		
# Steps

var current_step = 0

func try_step(step_name: String):
	match current_step:
		0:
			if step_name == "building_window_clicked":
				zoom_in_on_window()
				current_step += 1
		1:
			if step_name == "building_window_clicked":
				emit_signal("finished")

# Animation functions

func zoom_in_on_window():
	animation_player.play("camera_zoom_in")
