extends Node

var cur_speed = 1.0

var cur_priority = 0

func request_time_change(speed: float, priority: int):
	# Requests a change of time speed in engine
	if priority >= cur_priority:
		cur_speed = speed
		cur_priority = priority
		Engine.time_scale = cur_speed

func reset_speed():
	cur_speed = 1
	cur_priority = 0
	Engine.time_scale = cur_speed
