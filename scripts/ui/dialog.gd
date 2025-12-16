extends Node2D

var run_again = true

func set_speaker(speaker: String):
	$Dialog.title = speaker
	
func set_dialog(dialog: String, should_run_again: bool = true):
	run_again = should_run_again
	$Dialog/ColorRect/MarginContainer/dialog_label.text = dialog
	$Dialog.show()
	if len(dialog) <= 10:
		$dialog_timer.start(0.1 + (len(dialog)*0.4))
	else:
		$dialog_timer.start(0.1 + (len(dialog)*0.1))

func stop_dialog():
	$Dialog.hide()

func _on_dialog_timer_timeout() -> void:
	if run_again:
		Dialog.next_dialog()
	else:
		stop_dialog()
