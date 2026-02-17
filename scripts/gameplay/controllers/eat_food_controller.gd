extends Node2D
class_name EatFoodController

@onready var foods = $Foods

signal finished

var food_amount = 0
var eaten_foods = 0

func _ready():
	for food in foods.get_children():
		connect_signal(food)
		food_amount += 1

func connect_signal(food: Node):
	assert(food.has_signal("eaten"), "Food node is missing 'eaten' signal")
	food.eaten.connect(_on_food_eaten)

func _on_food_eaten():
	eaten_foods += 1
	if eaten_foods >= food_amount:
		emit_signal("finished")
	