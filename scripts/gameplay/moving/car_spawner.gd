extends Sprite2D
# Spawns cars at random intervals,
# moving either left to right or right to left based on configuration.

@onready var car_scene = preload("res://scenes/gameplay/day_1/moving/car.tscn")
@onready var car_timer = $CarTimer

var min_spawn_time = 2.0
var max_spawn_time = 7.0

@export var spawn_immediately := false
@export var facing_right := false

func _ready():
	randomize()
	set_timer(car_timer, min_spawn_time, max_spawn_time)
	if spawn_immediately:
		_spawn_car()

func _spawn_car():
	var car = car_scene.instantiate()
	
	car.position = Vector2.ZERO
	car.z_index = z_index
	
	add_child(car)
	car.start_moving(facing_right)  # Start moving right to left
	
	# restart timer with new random interval
	set_timer(car_timer, min_spawn_time, max_spawn_time)

func set_timer(timer: Timer, min_time: float, max_time: float):
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()
