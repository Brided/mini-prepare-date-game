extends Control

var main_menu_scene = "res://scenes/main/main_menu.tscn"

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file(main_menu_scene)

func _on_quit_button_pressed():
	get_tree().quit()
