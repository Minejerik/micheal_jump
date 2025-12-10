extends PathFollow2D


var speed = 0.3
var jumping = false
var running = false

enum RUNNING_MODE{player_box, dialog_trigger}


func _physics_process(delta: float) -> void:
	if running:
		if progress_ratio < 0.95:
			progress_ratio += delta*speed
	else:
		if progress_ratio > 0.01:
			progress_ratio -= delta*speed

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "player":
		running = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "player":
		running = false
