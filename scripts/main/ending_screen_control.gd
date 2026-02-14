extends Control

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file(ScenesGlobal.main_menu_scene)

func _on_quit_button_pressed():
	get_tree().quit()
