extends Control
class_name MainMenuControl

@onready var menu_buttons = $MenuButtons
var ui_open = false
	
func _on_play_button_pressed():
	if ui_open:
		return
	
	get_tree().change_scene_to_file(ScenesGlobal.day_1)
	
func _on_settings_button_pressed():
	if ui_open:
		return
	
	var settings = ScenesGlobal.settings_scene.instantiate()
	settings.close_settings.connect(_on_ui_closed)
	add_child(settings)
	ui_open = true

func _on_credits_button_pressed():
	if ui_open:
		return
	
	var credits = ScenesGlobal.credits_scene.instantiate()
	credits.close_credits.connect(_on_ui_closed)
	add_child(credits)
	ui_open = true

func _on_ui_closed():
	ui_open = false

func _on_quit_button_pressed():
	get_tree().quit()
