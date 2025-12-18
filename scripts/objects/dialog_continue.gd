extends Area2D

@export var ran = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && !ran:
		Dialog.next_dialog()
		ran = true

func toggle_interactable():
	ran = false
