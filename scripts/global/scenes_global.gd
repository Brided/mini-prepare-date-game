extends Node
class_name ScenesManager

# Global scene list and logic

func _ready():
	action_timer.one_shot = true
	action_timer.timeout.connect(_on_timer_timeout)

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
