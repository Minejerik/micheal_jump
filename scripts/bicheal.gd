extends CharacterBody2D

var started = false
# When death occurs, slght push towards player, looks better than hard stop
var pushed = false

@export var player: CharacterBody2D

func _ready() -> void:
	global_position = player.global_position
	DM.first_move.connect(first_move_start)

func first_move_start():
	$Timer.start()

func _physics_process(_delta: float) -> void:
	if started && !DM.player_dead:
		position = DM.last_positions[0]
		DM.last_positions.remove_at(0)
	elif started && DM.player_dead:
		if !pushed:
			pushed = true
			velocity = (player.global_position - global_position)
	move_and_slide()

func _on_timer_timeout() -> void:
	started = true
	$CollisionShape2D.disabled = false
	$death_area/CollisionShape2D.disabled = false
	self.visible = true

func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DM.kill_player()
