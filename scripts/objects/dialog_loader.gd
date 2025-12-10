extends Node2D

@export var box: Node2D
@export var controller: Node2D
@export var dialog_start_time = 1.0
@export var start_dialog = true

func _ready() -> void:
	Dialog.set_dialog_box(box)
	Dialog.set_level_controller(controller)
	$start_timer.start(dialog_start_time)


func _on_start_timer_timeout() -> void:
	if start_dialog:
		Dialog.start_dialog()
