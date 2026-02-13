extends Control

signal close_credits()

func _on_ok_button_pressed():
	emit_signal("close_credits")
	queue_free()

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_ok_button_pressed()
