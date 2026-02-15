extends AnimatedSprite2D

@onready var notif_sound = $Notif

# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")
	
func set_active(active):
	if active:
		play("notif")
		notif_sound.play()
	else:
		play("idle")
