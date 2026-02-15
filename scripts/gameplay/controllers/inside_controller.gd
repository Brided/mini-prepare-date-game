extends Node2D
class_name InsideController

signal clicked

@onready var phone = $Phone
@onready var animation_player = $AnimationPlayer

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked")

func animate_notification():
	phone.set_active(true)

func animate_turn_around():
	animation_player.play("barnaby_turn_around")

func animate_reach_phone():
	animation_player.play("barnaby_extend_hand")

func animate_show_phone():
	animation_player.play("show_phone")

func animate_reply():
	animation_player.play("show_phone_reply")
	
