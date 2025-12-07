extends CanvasLayer


func _on_start_game_button_down() -> void:
	DM.start_game()



func _on_settings_button_pressed() -> void:
	$Settings.show()
