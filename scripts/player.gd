extends CharacterBody2D

@export var gravity = 800
@export var jump_speed = -300
@export var run_speed = 200
@export var bicheal_mode = false

var jumping = false
var dying = false
var send_pos = false

var save_velocity

func _ready() -> void:
	Engine.time_scale = 1
	DM.player_death.connect(handle_death)
	PM.game_paused.connect(pause_save_velocity)
	PM.game_unpaused.connect(unpause_restore_velocity)

func pause_save_velocity():
	save_velocity = velocity

func unpause_restore_velocity():
	velocity = save_velocity

func handle_death():
	dying = true
	Engine.time_scale = 0.2
	$DeathParticles.emitting = true
	var temp = create_tween()
	temp.tween_property($Camera2D, "zoom", Vector2(4.5,4.5), 0.1).set_trans(Tween.TRANS_QUAD)
	$DeathTimer.start()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	if !dying:
		if Input.is_action_pressed("jump") and (is_on_floor() || DM.allowed_jump_again):
			jumping = true
			velocity.y = jump_speed
			
		if jumping and is_on_floor():
			jumping = false
			
		var input_direction = Input.get_axis("ui_left", "ui_right")
		velocity.x = input_direction * run_speed
	
	move_and_slide()
	
	if bicheal_mode && send_pos:
		DM.bicheal_add_position(position)

func _input(_event: InputEvent) -> void:
	send_pos = true

func _on_death_timer_timeout() -> void:
	DM.player_death_callback()
