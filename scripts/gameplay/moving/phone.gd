extends AnimatedSprite2D

@onready var notif_sound = $Notif

# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")
	
func activate(active):
	if active:
		play("notif")
		play_sound()
	else:
		play("idle")

func play_sound():
	notif_sound.play()
