extends Node2D

var current_dragger: DragFlower = null

func bring_flowers_to_front(flower: Area2D):
	move_child(flower, get_child_count() - 1)
