extends Node2D

@export var door1: Node2D
@export var door2: Node2D

func toggle_door(door:int):
	match door:
		1: door1.toggle_door()
		2: door2.toggle_door()
