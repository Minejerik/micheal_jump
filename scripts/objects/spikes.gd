extends RigidBody2D


func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DM.kill_player()
