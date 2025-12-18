extends Node

var DIALOG = {
	"level1": [
		"%SPEAKER:PA Voice%",
		"Welcome to the MICHEALSOFT testing center!",
		"You will work on testing MICHEALSOFT products!",
		"The chamber door will open in",
		"3",
		"2",
		"1",
		"%TOGGLEINT:1%",
		"Please leave the chamber to your right!",
		"%STOP%",
		"Find your way to the Michealsoft goal!",
		"%STOP%"
	],
	"level2": [
		"%SPEAKER:PA Voice%",
		"This next chamber contains",
		"MICHEALSOFT Intellectual Property Protection Devices",
		"They may cause death when contacted",
		"Stay Safe!",
		"%TOGGLEINT:1%",
		"%STOP%"
	],
	"level3":[
		"%SPEAKER:PA Voice%",
		"This chamber contains a",
		"MICHEALSOFT 365 Acceleration Device",
		"To operate",
		"Jump on it and then jump again while in contact",
		"Failure to do so may result in death!",
		"%TOGGLEINT:1%",
		"%STOP%"
	],
	"level4": [
		"%SPEAKER:PA Voice%",
		"This chamber contains a",
		"MICHEALSOFT Assured Transit platform",
		"Step on the platform and the rest is automatic!",
		"Have fun!",
		"%TOGGLEINT:1%",
		"%STOP%",
		"%TOGGLEINT:2%",
		"%STOP%"
	],
	"level5": [
		"%SPEAKER:PA Voice%",
		"Due to budget cuts only this door can be opened automatically",
		"Step on the MICHEALSOFT Secure Access Plate to open the second door",
		"Warning: MSSAP may cause death when provoked",
		"%TOGGLEINT:1%",
		"%STOP%",
		"Good to see the you haven't provoked the button!",
		"%STOP%"
	],
	"sec1end": [
		"%SPEAKER:PA Voice%",
		"You have reached the end of testing.",
		"Please leave through the door and step on the platform.",
		"%TOGGLEINT:7%",
		"%STOP%",
		"Thank you for participating in MICHEALSOFT Testing!",
		"Rewards are not in the cards as of now",
		"Enjoy!",
		"%TOGGLEINT:1%",
		"%TOGGLEINT:2%",
		"%TOGGLEINT:4%",
		"%TOGGLEINT:5%",
		"%PAUSE:10%",
		"INITIATE MICHEALSOFT CLEANING PROCEDURE",
		"%TOGGLEINT:6%",
		"%STOP%",
		"%SPEAKER:Unknown Voice%",
		"%TOGGLEINT:6%",
		"hello",
		"i am here to help",
		"if you want to live you must escape",
		"i will guide you",
		"ill explain more later just RUN",
		"im opening the door for you right now",
		"%TOGGLEINT:8%",
		"%STOP%"
	],
	"sec2level1": [
		"%SPEAKER:Unknown Voice%",
		"you need to make your way to the michealsoft distribution servers",
		"you need to destroy them",
		"im clearing the way for you now",
		"%TOGGLEINT:1%",
		"%STOP%",
		"michealsoft is an evil company",
		"my name is clip by the way",
		"%SPEAKER:Clip%",
		"%STOP%"
	],
	"sec2level2": [
		"%SPEAKER:Clip%",
		"you are heading towards the servers now",
		"they allow michealsoft to distribute their OSs",
		"destroying them will hurt them",
		"%STOP%"
	],
	"sec2serverintro": [
		"%SPEAKER:Clip",
		"you are near",
		"i cant open the second door",
		"%TOGGLEINTR:1%",
		"use the computer and open it yourself",
		"%STOP%"
	],
	"sec2servermain":[
		"%SPEAKER:Clip",
		"you made it",
		"%STOP%",
		"go past the servers and into the control room",
		"opening the door for you now",
		"%TOGGLEINTR:1%",
		"%STOP%",
		"%TOGGLEINTR:1%",
		"just past that door is the button",
		"im going to hack that button to destroy the servers",
		"give me a sec",
		"3",
		"2",
		"1",
		"there we are",
		"press that button, and youll help the world",
		"%TOGGLEINTR:2%",
		"%STOP%",
		"%TOGGLEINTR:2%",
		"you did it",
		"%SPEAKER:Automated Voice%",
		"SERVICE DISRUPTION DETECTED",
		"DEPLOYING MICHEALSOFT SECURITY TECHNOLOGY",
		"BICHEAL",
		"%SPEAKER:Clip%",
		"oh shit",
		"micheal, your gonna have to run",
		"opening all doors now",
		"%TOGGLEINTR:1%",
		"%TOGGLEINTR:2",
		"i wish you luck",
		"%STOP%"
	]
}

var dialog_box: Node2D
var level_controller: Node2D

var curr_dialog = ["TEST DIALOG", "TEST", "TEST", "FIXME"]

var curr_dialog_counter = 0

var curr_speaker = "!!FIX ME!!"

func set_dialog_box(box: Node2D):
	dialog_box = box

func set_level_controller(controller: Node2D):
	level_controller = controller

func run_dialog(speaker, dialog):
	dialog_box.set_speaker(speaker)
	dialog_box.set_dialog(dialog, false)

func stop_dialog():
	dialog_box.stop_dialog()

func start_dialog():
	curr_dialog = DIALOG[DM.levels[DM.level_counter]]
	curr_dialog_counter = 0
	next_dialog()
	
func next_dialog():
	var curr = curr_dialog[curr_dialog_counter]
	print("next dialog "+str(curr_dialog_counter)+": "+curr)
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
		elif "TOGGLEINT" in curr:
			var door_to_open = int(curr.replace("TOGGLEINT:", ""))
			level_controller.toggle_interactable(door_to_open)
			curr_dialog_counter += 1
			next_dialog()
		elif "PAUSE" in curr:
			dialog_box.stop_dialog()
			var time_to_pause = int(curr.replace("PAUSE:", ""))
			curr_dialog_counter += 1
			await get_tree().create_timer(time_to_pause).timeout
			next_dialog()
			
		
