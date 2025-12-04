extends CharacterBody2D

@export var gravity = 800
@export var jump_speed = -300
@export var run_speed = 200
@export var bicheal_mode = false

var jumping = false
var dying = false

func _ready() -> void:
	DM.player_death.connect(handle_death)

func handle_death():
	dying = true
	$DeathParticles.emitting = true
	$DeathTimer.start()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	if !dying:
		if Input.is_action_just_pressed("ui_up") and (is_on_floor() || DM.allowed_jump_again):
			jumping = true
			velocity.y = jump_speed
			
		if jumping and is_on_floor():
			jumping = false
			
		var input_direction = Input.get_axis("ui_left", "ui_right")
		velocity.x = input_direction * run_speed
	
	move_and_slide()
	
	if bicheal_mode:
		DM.bicheal_add_position(position)

func _on_death_timer_timeout() -> void:
	DM.player_death_callback()
