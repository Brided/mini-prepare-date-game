extends Area2D
class_name DragFlower

# Drag and drop flower interaction

signal dropped # Emit then check if right place

var dragging_enabled = true # False means flower is already in the right place

var dragging = false
var mouse_in = false
var drag_offset = Vector2.ZERO

@onready var flower_sprite = $FlowersFlower

func _input(event):
	if ScenesGlobal.step_in_progress:
		return
	if not dragging_enabled:
		return
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and mouse_in:
				if get_parent().current_dragger and get_parent().current_dragger != self:
					return # Another flower is being dragged, ignore this one

				get_parent().bring_flowers_to_front(self)
				get_parent().current_dragger = self
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
			else:
				if dragging:
					get_parent().current_dragger = null
				
					dragging = false
					drag_offset = Vector2.ZERO
					emit_signal("dropped")

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() + drag_offset

func _mouse_enter():
	darken()
	mouse_in = true

func _mouse_exited():
	brighten()
	mouse_in = false

func darken():
	flower_sprite.modulate = Color(0.8, 0.8, 0.8, 1)

func brighten():
	flower_sprite.modulate = Color(1, 1, 1, 1)
