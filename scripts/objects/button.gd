extends StaticBody2D

@export var to_trigger: Node2D
@export var toggle = false
@export var trigger_dialog = false
var pressed = false
var ran_dialog = false

func _process(delta: float) -> void:
	if pressed:
		$AnimatedSprite2D.play("pressed")
	else:
		$AnimatedSprite2D.play("unpressed")

func _on_press_area_body_entered(body: Node2D) -> void:
	if body.name != "Button":
		if !ran_dialog && trigger_dialog:
			ran_dialog = true
			Dialog.next_dialog()
		if toggle:
			if !pressed:
				to_trigger.toggle_interactable()
				$AnimationPlayer.play("button_press")
				pressed = true
			else:
				pressed = false
				to_trigger.toggle_interactable()
				$AnimationPlayer.play("button_unpress")
		else:
			to_trigger.toggle_interactable()
			$AnimationPlayer.play("button_press")
			pressed = true

func _on_press_area_body_exited(body: Node2D) -> void:
	if body.name != "Button":
		if !toggle:
			pressed = false
			to_trigger.toggle_interactable()
			$AnimationPlayer.play("button_unpress")
