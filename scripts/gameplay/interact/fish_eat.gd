extends Area2D

var mouse_in = false
var finished = false

signal eaten

@onready var fish_sprite = $FishSprite

func _ready():
	fish_sprite.animation_finished.connect(_on_animation_finished)

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and mouse_in:
				if not finished:
					fish_sprite.play("eating")
				
func _on_animation_finished():
	brighten()
	finished = true
	emit_signal("eaten")

func _mouse_enter():
	darken()
	mouse_in = true

func _mouse_exited():
	brighten()
	mouse_in = false

func darken():
	if finished:
		return
	fish_sprite.modulate = Color(0.8, 0.8, 0.8, 1)

func brighten():
	if finished:
		return
	fish_sprite.modulate = Color(1, 1, 1, 1)
