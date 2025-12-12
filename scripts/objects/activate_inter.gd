extends Area2D

var ran = false
@export var inter: Node2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && !ran:
		inter.toggle_interactable()
		ran = true
