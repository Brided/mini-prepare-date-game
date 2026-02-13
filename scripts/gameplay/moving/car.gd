extends Sprite2D

var tween: Tween
@onready var x = position.x
@export var speed_time = 10.0

# Go 1.25 times the screen width
@onready var length = 1.25 * 1280

func start(go_right: bool = false):
	tween = get_tree().create_tween()
	if go_right:
		scale.x = -scale.x  # Flip sprite if coming from the left
		tween.tween_property(self, "position:x", x + length, speed_time)
	else:
		tween.tween_property(self, "position:x", x - length, speed_time)
		
		tween.tween_callback(queue_free)
