extends PathFollow2D


var speed = 0.3
var jumping = false

func _physics_process(delta: float) -> void:
	progress_ratio += delta*speed


func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DM.kill_player()
