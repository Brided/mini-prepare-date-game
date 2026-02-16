extends Node2D
class_name TheyKissController

signal finished

@onready var animation_player = $AnimationPlayer

# Input handling

var wait_time = 0.5

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton and event.pressed:
		try_step("they_kiss_scene_clicked")
		ScenesGlobal.start_action_timer(wait_time)

# Steps

func _ready():
	current_step = 0

var current_step = 0

func try_step(step_name: String):
	match current_step:
		0:
			if step_name == "they_kiss_scene_clicked":
				make_them_kiss()
				wait_time = 1.25
				current_step += 1
		1:
			if step_name == "they_kiss_scene_clicked":
				wait_time = ScenesGlobal.default_action_wait_time
				emit_signal("finished")

# Animation functions

func make_them_kiss():
	animation_player.play("they_kiss_kiss")
