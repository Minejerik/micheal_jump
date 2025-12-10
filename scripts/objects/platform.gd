extends PathFollow2D


@export var speed = 0.2
var jumping = false
var running = false
@export var mode: RUNNING_MODE = RUNNING_MODE.player_box

enum RUNNING_MODE{player_box, dialog_trigger}


func _physics_process(delta: float) -> void:
	if running:
		if progress_ratio < 0.95:
			progress_ratio += delta*speed
	else:
		if progress_ratio > 0.01:
			progress_ratio -= delta*speed
			
func toggle_interactable():
	if mode == RUNNING_MODE.dialog_trigger:
		running = !running

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "player" && mode == RUNNING_MODE.player_box:
		running = true

func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.name == "player" && mode == RUNNING_MODE.player_box:
		running = false
