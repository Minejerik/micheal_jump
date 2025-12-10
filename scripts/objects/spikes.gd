extends StaticBody2D

@export var activated = true

func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "player" && activated:
		DM.kill_player()
