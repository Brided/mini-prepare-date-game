extends Control
class_name MainMenuControl

var play_scene = preload("res://scenes/gameplay/day_1/scene_1.tscn")
var settings_scene = preload("res://scenes/main/main_settings.tscn")
var credits_scene = preload("res://scenes/main/main_credits.tscn")

@onready var menu_buttons = $MenuButtons
var ui_open = false
	
func _on_play_button_pressed():
	if ui_open:
		return
	
	get_tree().change_scene_to_packed(play_scene)
	
func _on_settings_button_pressed():
	if ui_open:
		return
	
	var settings = settings_scene.instantiate()
	settings.close_settings.connect(_on_ui_closed)
	add_child(settings)
	ui_open = true

func _on_credits_button_pressed():
	if ui_open:
		return
	
	var credits = credits_scene.instantiate()
	credits.close_credits.connect(_on_ui_closed)
	add_child(credits)
	ui_open = true

func _on_ui_closed():
	ui_open = false

func _on_quit_button_pressed():
	get_tree().quit()
