extends Node
class_name ScenesManager

# Global scene list and logic

func _ready():
	action_timer.one_shot = true
	action_timer.timeout.connect(_on_timer_timeout)
	
	music_player.play()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(cursor_idle, Input.CURSOR_ARROW, hotspot_offset)

# Main Menus

var main_menu_scene = "res://scenes/main/main_menu.tscn"
var settings_scene = preload("res://scenes/main/main_settings.tscn")
var credits_scene = preload("res://scenes/main/main_credits.tscn")
var ending_scene = "res://scenes/main/ending_menu.tscn"

# Day scenes

## Day 1

var day_1 = "res://scenes/gameplay/day_1/scene_1.tscn"

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
	update_cursor_state()

func _on_timer_timeout():
	step_in_progress = false
	update_cursor_state()

# Cursor

var hotspot_offset = Vector2(13, 0)

var cursor_idle = preload("res://assets/cursor/walrus_cursor_scaled__idle.png")
var cursor_click = preload("res://assets/cursor/walrus_cursor_scaled__clicked.png")
var cursor_wait = preload("res://assets/cursor/walrus_cursor_scaled__wait.png")
var cursor_clicked_wait = preload("res://assets/cursor/walrus_cursor_scaled__clicked_wait.png")

var holding_click = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			holding_click = true
		else:
			holding_click = false
	
	update_cursor_state()

func update_cursor_state():
	if holding_click and step_in_progress:
		Input.set_custom_mouse_cursor(cursor_clicked_wait, Input.CURSOR_ARROW, hotspot_offset)
	elif holding_click:
		Input.set_custom_mouse_cursor(cursor_click, Input.CURSOR_ARROW, hotspot_offset)
	elif step_in_progress:
		Input.set_custom_mouse_cursor(cursor_wait, Input.CURSOR_ARROW, hotspot_offset)
	else:
		Input.set_custom_mouse_cursor(cursor_idle, Input.CURSOR_ARROW, hotspot_offset)

# Music

@onready var music_player = $SimpleMusicLoop

func set_music_volume(value):
	music_player.volume_db = value

func pause_music():
	music_player.pause()

func resume_music():
	music_player.play()
