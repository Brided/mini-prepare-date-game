extends Node2D

var ending_scene = "res://scenes/main/ending_menu.tscn"

@onready var car_timer_r2l = $CarTimerR2L
@onready var car_timer_l2r = $CarTimerL2R

@onready var car_spawn_point = $CarSpawnRight
@onready var car_spawn_left = $CarSpawnLeft

@onready var cars = $Cars

var special_car_chance = 1.0 / 1000.0 # Chance for a special car to spawn, can be used for easter eggs or special events

var r2l_z_index = 0
var l2r_z_index = 1

var min_spawn_time = 2.0
var max_spawn_time = 7.0

@onready var car_scene = preload("res://scenes/gameplay/day_1/moving/car.tscn")

func _ready():
	randomize()
	set_timer(car_timer_r2l, min_spawn_time, max_spawn_time)
	set_timer(car_timer_l2r, min_spawn_time, max_spawn_time)
	
	_spawn_car_l2r()
	
	car_timer_r2l.timeout.connect(_spawn_car_r2l)
	car_timer_l2r.timeout.connect(_spawn_car_l2r)

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file(ending_scene)

func _spawn_car_r2l():
	var car = car_scene.instantiate()
	car.position = car_spawn_point.position
	car.z_index = r2l_z_index
	
	cars.add_child(car)
	car.start(false)  # Start moving right to left
	
	# restart timer with new random interval
	set_timer(car_timer_r2l, min_spawn_time, max_spawn_time)

func _spawn_car_l2r():
	var car = car_scene.instantiate()
	car.position = car_spawn_left.position
	car.z_index = l2r_z_index
	
	cars.add_child(car)
	car.start(true)  # Start moving left to right
	
	# restart timer with new random interval
	set_timer(car_timer_l2r, min_spawn_time, max_spawn_time)

func set_timer(timer: Timer, min_time: float, max_time: float):
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()
	