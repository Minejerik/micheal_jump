extends Node

var is_paused = false

signal game_paused
signal game_unpaused

func pause():
	get_tree().paused = true
	game_paused.emit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if !is_paused:
			pause()
		else:
			unpause()

func unpause():
	get_tree().paused = false
	game_unpaused.emit()
