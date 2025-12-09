extends Node

var DIALOG = {
	"level1": [
		#"%SPEAKER:Biden%",
		"Welcome to the MICHEALSOFT testing center!",
		"You will work on testing MICHEALSOFT products!",
		"The chamber door will open in",
		"3",
		"2",
		"1",
		"%TOGGLEDOOR:1%",
		"Please leave the chamber to your right!",
		"%STOP%",
		"Find your way to the Michealsoft goal!",
		"%STOP%"
	]
}

var dialog_box: Node2D
var level_controller: Node2D

var curr_dialog = ["TEST DIALOG", "TEST", "TEST", "FIXME"]

var curr_dialog_counter = 0

var curr_speaker = "PA Voice:"

func set_dialog_box(box: Node2D):
	dialog_box = box

func set_level_controller(controller: Node2D):
	level_controller = controller

func start_dialog():
	curr_dialog = DIALOG[DM.levels[DM.level_counter]]
	curr_dialog_counter = 0
	next_dialog()
	
func next_dialog():
	var curr = curr_dialog[curr_dialog_counter]
	if "%" not in curr:
		dialog_box.set_speaker(curr_speaker)
		dialog_box.set_dialog(curr)
		curr_dialog_counter += 1
	else:
		curr = curr.replace("%", "")
		if curr == "STOP":
			curr_dialog_counter += 1
			dialog_box.stop_dialog()
		elif "SPEAKER" in curr:
			curr_speaker = curr.replace("SPEAKER:", "") + ":"
			curr_dialog_counter += 1
			next_dialog()
		elif "TOGGLEDOOR" in curr:
			var door_to_open = int(curr.replace("TOGGLEDOOR:", ""))
			level_controller.toggle_door(door_to_open)
			curr_dialog_counter += 1
			next_dialog()
		
