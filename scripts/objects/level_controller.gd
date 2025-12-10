extends Node2D

@export var interactables: Array[Node]

func toggle_interactable(interactable:int):
	interactables[interactable-1].toggle_interactable()
