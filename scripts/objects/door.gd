extends Node2D

@export var door_open = false

func open_door():
	door_open = true
	$AnimationPlayer.play("door_open")

func close_door():
	door_open = false
	$AnimationPlayer.play("door_close")

func toggle_interactable():
	if door_open:
		close_door()
	else:
		open_door()
