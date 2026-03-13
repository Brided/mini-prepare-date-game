extends Node2D
class_name SubsceneManagerClass

# SubsceneManager controls the subscenes within a scene.

@onready var scene_name := self.name

func _ready():
	print ("Scene loaded: " + ScenesManager.current_scene.name)
	print ("Scene loaded: " + scene_name)
	ScenesManager.next_day()
