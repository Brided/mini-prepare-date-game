extends Node2D

func load_next_scene():
	ScenesGlobal.load_next_day_scene()

@export var subscene_list: Array[PackedScene]

var current_subscene_index = 0
var current_subscene = null

func swap_subscene(new_subscene):
	if current_subscene:
		current_subscene.queue_free()
	current_subscene = new_subscene
	add_child(current_subscene)

func load_next_subscene():
	if current_subscene_index < subscene_list.size():
		var subscene = subscene_list[current_subscene_index]
		var instance = subscene.instantiate()
		
		disconnect_subscene_signals()
		swap_subscene(instance)
		connect_subscene_signals()
		
		current_subscene_index += 1
	else:
		load_next_scene()
	
func _ready():
	load_next_subscene()

func _on_subscene_finished():
	load_next_subscene()

func connect_subscene_signals():
	assert(current_subscene.has_signal("finished"), "Current subscene is missing 'finished' signal")
	current_subscene.finished.connect(_on_subscene_finished)

func disconnect_subscene_signals():
	if current_subscene and current_subscene.has_signal("finished"):
		current_subscene.finished.disconnect(_on_subscene_finished)
