extends Node2D

func set_speaker(speaker: String):
	$Dialog.title = speaker
	
func set_dialog(dialog: String):
	$Dialog/ColorRect/MarginContainer/dialog_label.text = dialog
	$Dialog.show()
	$dialog_timer.start(0.1 + (len(dialog)*0.2))

func stop_dialog():
	$Dialog.hide()

func _on_dialog_timer_timeout() -> void:
	Dialog.next_dialog()
