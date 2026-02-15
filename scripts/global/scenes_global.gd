extends Node
class_name ScenesManager

# Global scene list and logic

func _ready():
	action_timer.one_shot = true
	action_timer.timeout.connect(_on_timer_timeout)
	
	music_player.play()

# Main Menus

var main_menu_scene = "res://scenes/main/main_menu.tscn"
var settings_scene = preload("res://scenes/main/main_settings.tscn")
var credits_scene = preload("res://scenes/main/main_credits.tscn")
var ending_scene = "res://scenes/main/ending_menu.tscn"

# Day scenes

## Day 1

var day_1 = "res://scenes/gameplay/day_1/scene_1.tscn"
var building_scene = preload("res://scenes/gameplay/day_1/building_scene.tscn")
var inside_scene = preload("res://scenes/gameplay/day_1/inside_scene.tscn")

## Day 2

var day_2 = "res://scenes/gameplay/day_2/Scene_2.tscn"

## Day 3

var day_3 = "res://scenes/gameplay/day_3/Scene_3.tscn"

## Day J

var day_j = "res://scenes/gameplay/day_J/Scene_J.tscn"

# Day Manager

var current_level_index = 0
var current_day_scene = null
var day_scenes = [null, day_1, day_2, day_3, day_j]

func load_next_day_scene():
	if current_level_index < day_scenes.size() - 1:
		current_level_index += 1
		current_day_scene = day_scenes[current_level_index]
		get_tree().change_scene_to_file(current_day_scene)
		return
	else:
		current_level_index = 0
		current_day_scene = null
		get_tree().change_scene_to_file(ending_scene)
		return

func load_day_scene(day_index):
	if day_index >= 0 and day_index < day_scenes.size():
		current_level_index = day_index
		current_day_scene = day_scenes[current_level_index]
		get_tree().change_scene_to_file(current_day_scene)
		return
	else:
		print("Invalid day index: ", day_index)

# Timer

@onready var action_timer = $ActionTimer
@onready var default_action_wait_time = 0.5
var step_in_progress = false

func start_action_timer(wait_time = default_action_wait_time):
	step_in_progress = true
	action_timer.wait_time = wait_time
	action_timer.start()

func _on_timer_timeout():
	step_in_progress = false

# Music

@onready var music_player = $SimpleMusicLoop

func set_music_volume(value):
	music_player.volume_db = value

func pause_music():
	music_player.pause()

func resume_music():
	music_player.play()
