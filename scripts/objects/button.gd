extends StaticBody2D

@export var to_trigger: Node2D
@export var toggle = false
@export var one_shot = false
@export var trigger_dialog = false
var pressed = false
var ran_dialog = false
var ran_once = false

func _process(_delta: float) -> void:
	if pressed:
		$AnimatedSprite2D.play("pressed")
	else:
		$AnimatedSprite2D.play("unpressed")

func _on_press_area_body_entered(body: Node2D) -> void:
	if "Button" not in body.name:
		if ran_once && one_shot:
			return
		if !ran_dialog && trigger_dialog:
			ran_dialog = true
			Dialog.next_dialog()
		if toggle:
			if !pressed:
				to_trigger.toggle_interactable()
				$AnimationPlayer.play("button_press")
				pressed = true
				ran_once = true
			else:
				pressed = false
				to_trigger.toggle_interactable()
				$AnimationPlayer.play("button_unpress")
		else:
			to_trigger.toggle_interactable()
			$AnimationPlayer.play("button_press")
			pressed = true
			ran_once = true

func _on_press_area_body_exited(body: Node2D) -> void:
	if body.name != "Button":
		if ran_once && one_shot:
			return
		if !toggle:
			pressed = false
			to_trigger.toggle_interactable()
			$AnimationPlayer.play("button_unpress")
