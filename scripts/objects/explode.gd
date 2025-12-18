extends Node2D

@export var to_explode: Array[RigidBody2D]
@export var power:float = 10

func toggle_interactable():
	explode()

func explode():
	$GPUParticles2D.emitting = true
	for object in to_explode:
		object = object as RigidBody2D
		var temp = object.global_position - global_position
		temp = temp * Vector2(power, power)
		object.apply_central_impulse(temp)
