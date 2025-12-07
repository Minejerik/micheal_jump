extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Engine.time_scale = 0.4
		$Label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		Engine.time_scale = 1
		$Label.hide()
