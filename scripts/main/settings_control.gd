extends Control

signal close_settings()

func _on_ok_button_pressed():
	emit_signal("close_settings")
	queue_free()

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_ok_button_pressed()
