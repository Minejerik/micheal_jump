extends Window

func _ready() -> void:
	$ColorRect/MarginContainer/VBoxContainer/HBoxContainer/VolumeSlider.value = SM.SETTINGS["volume"]

func _on_close_requested() -> void:
	hide()

func _on_settings_save_pressed() -> void:
	SM.SETTINGS["volume"] = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/VolumeSlider.value
