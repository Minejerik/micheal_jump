extends RigidBody2D

@export var dialog_control = false

func _ready() -> void:
	if dialog_control:
		hide()
		set_freeze_enabled(true)
		$CollisionShape2D.disabled = true

func toggle_interactable():
	if dialog_control:
		show()
		set_freeze_enabled(false)
		$CollisionShape2D.disabled = false
