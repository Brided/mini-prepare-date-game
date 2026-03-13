extends Node
class_name ScenesManagerClass #Autoload name: ScenesManager

# ScenesManager controls the scenes changing.

# Scenes roughly:
# - Start Menu
# - Days
# - Ending Screen

# Scene List

var current_day = 1

var control_scenes = {
  "start_menu": "res://scenes/main/main_menu.tscn",
  "ending_menu": "res://scenes/main/ending_menu.tscn"
}

var day_scenes = [
  null, # No day 0
  "res://scenes/day_scenes/day_1.tscn",
  "res://scenes/day_scenes/day_2.tscn",
  "res://scenes/day_scenes/day_J.tscn"
]

# Scene Changer

var current_scene: Node

func change_scene(new_scene: String):
  if current_scene and is_instance_valid(current_scene):
    current_scene.queue_free()

  var scene = load(new_scene).instantiate()
  current_scene = scene
  get_tree().root.add_child(scene)
  get_tree().set_current_scene(scene)

# Go to specific scenes

func start_game():
  current_day = 1
  load_day()

func load_day():
  if 0 < current_day and current_day < day_scenes.size():
    change_scene(day_scenes[current_day])
  elif current_day >= day_scenes.size():
    change_scene(control_scenes["ending_menu"])
  else: # Smaller than 1
    change_scene(control_scenes["start_menu"])

func next_day():
  current_day += 1
  load_day()

func go_to_start_menu():
  change_scene(control_scenes["start_menu"])

func go_to_ending_menu():
  change_scene(control_scenes["ending_menu"])

# Ready

func _ready():
  current_scene = get_tree().current_scene # Get the "Main Scene"
  print("ScenesManager ready.")
