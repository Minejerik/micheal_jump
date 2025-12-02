extends Node2D

var cool_down = false

func _physics_process(_delta: float) -> void:
	if cool_down:
		$Sprite2D.texture.region = Rect2(19, 3, 10, 10)
	else:
		$Sprite2D.texture.region = Rect2(4, 4, 8, 8)
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player" && cool_down == false:
		DM.allowed_jump_again = true
		cool_down = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		DM.allowed_jump_again = false
		$Timer.start()

func _on_timer_timeout() -> void:
	cool_down = false
