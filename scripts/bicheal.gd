extends CharacterBody2D

var started = false

func _ready() -> void:
	DM.first_move.connect(first_move_start)

func first_move_start():
	$Timer.start()

func _physics_process(_delta: float) -> void:
	if started:# && !DM.player_dead:
		position = DM.last_positions[0]
		DM.last_positions.remove_at(0)
		

func _on_timer_timeout() -> void:
	started = true
	$CollisionShape2D.disabled = false
	$death_area/CollisionShape2D.disabled = false
	self.visible = true

func _on_death_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DM.kill_player()
