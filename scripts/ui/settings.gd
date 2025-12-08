extends Window

@onready var volume_slider = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/VolumeSlider
@onready var assist_check = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer2/assistCheck

func _ready() -> void:
	volume_slider.value = SM.SETTINGS["volume"]
	assist_check.set_pressed_no_signal(SM.SETTINGS["assist"])
	PM.game_unpaused.connect(hide)

func _on_close_requested() -> void:
	hide()

func _on_settings_save_pressed() -> void:
	SM.SETTINGS["volume"] = volume_slider.value
	SM.SETTINGS["assist"] = assist_check.is_pressed()
