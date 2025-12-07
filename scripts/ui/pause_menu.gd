extends CanvasLayer


func _ready() -> void:
	PM.game_paused.connect(pause)
	PM.game_unpaused.connect(unpause)

func pause():
	$Window.show()
	
func unpause():
	$Window.hide()


func _on_return_button_pressed() -> void:
	print("here")
	PM.unpause()

func _on_restart_button_pressed() -> void:
	PM.unpause()
	DM.restart_level()

func _on_quit_button_pressed() -> void:
	PM.unpause()
	# Loads the main menu scene
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_settings_button_pressed() -> void:
	$Settings.show()
