extends Area2D

@export var to_show: Array[Node]
@export var to_open: Array[Node2D]
@export var button_to_open: Button
@export var haf: Node2D

var player_in_range = false

func _ready() -> void:
	button_to_open.pressed.connect(open_all)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = true
		if !DM.using_computer:
			Dialog.run_dialog("Computer: ", "Press E to open computer")

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_range = false
		Dialog.stop_dialog()

func open_all():
	hide_showables()
	for thing in to_open:
		thing.toggle_interactable()

func _input(event: InputEvent) -> void:
	if event.is_action("interact") && player_in_range:
		Dialog.stop_dialog()
		haf.toggle_interactable()
		show_showables()
		DM.using_computer = true

func show_showables():
	for thing in to_show:
		thing.show()

func hide_showables():
	for thing in to_show:
		thing.hide()
	DM.using_computer = false
