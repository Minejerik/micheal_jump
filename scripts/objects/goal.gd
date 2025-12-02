extends Node2D


func _on_win_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DM.next_level()
