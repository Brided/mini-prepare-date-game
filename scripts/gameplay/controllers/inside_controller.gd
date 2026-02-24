extends Node2D
class_name InsideController

signal finished

@onready var phone = $Phone
@onready var animation_player = $AnimationPlayer

# Input handling

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				try_step("inside_scene_clicked")
				ScenesGlobal.start_action_timer()
	

# Steps

func _ready():
	current_step = 0

var current_step = 0

func try_step(step_name: String):
	match current_step:
		0:
			if step_name == "inside_scene_clicked":
				animate_notification()
				animate_turn_around()
				current_step += 1
		1:
			if step_name == "inside_scene_clicked":
				animate_reach_phone()
				current_step += 1
		2:
			if step_name == "inside_scene_clicked":
				animate_show_phone()
				current_step += 1
		3:
			if step_name == "inside_scene_clicked":
				animate_reply()
				phone.play_sound()
				current_step += 1
		4:
			if step_name == "inside_scene_clicked":
				emit_signal("finished")

# Animation functions

func animate_notification():
	phone.activate(true)

func animate_turn_around():
	animation_player.play("barnaby_turn_around")

func animate_reach_phone():
	animation_player.play("barnaby_extend_hand")

func animate_show_phone():
	animation_player.play("show_phone")

func animate_reply():
	animation_player.play("show_phone_reply")
	
