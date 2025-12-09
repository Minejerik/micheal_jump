extends Area2D

var ran = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && !ran:
		Dialog.next_dialog()
		ran = true
