extends Node

# If the player is in a "jump again" node
var allowed_jump_again = false
# Counter of the players deaths
var deaths = 0

# The current level the player is on
var level_counter = 0
# The list of all levels
var levels = ["sec2server", "level1", "level2", "level3", "level4", "level5", "level6", "sec1end", "sec2level1", "sec2level2",]

# BICHEAL STUFF
var last_positions = []
signal first_move
var is_first_move

# Called when the player dies, sent to player to play blood animation
signal player_death
# Called when the player picks up an item, used for ui
signal item_picked_up(item_id)
# If the player is currently dead or not
var player_dead = false


# Queue for items discovered in a level
# If level is beaten, added to items found
# If level failed, clear
var item_discovery_queue = []

# Items discovered
var items_discovered = []

func start_game():
	level_counter = 0
	# Starts the game, eg loads the first level
	call_deferred("_load_level", levels[0])


func restart_level():
	call_deferred("_load_level", levels[level_counter])
	

func _load_level(level:String):
	last_positions = []
	is_first_move = false
	player_dead = false
	TM.reset_speed()
	# Load a level, based on its name
	get_tree().change_scene_to_file("res://scenes/levels/"+level+".tscn")

func player_death_callback():
	last_positions = []
	TM.reset_speed()
	# Callback from the player, after they die, after animation plays + buffer
	call_deferred("_load_level", levels[level_counter])

func pick_up(item_id):
	print("PICK UP")
	# Pick up an item
	item_discovery_queue.append(item_id)
	item_picked_up.emit(item_id)

func next_level():
	if !player_dead:
		# Goes to the next level, increments level counter and loads it
		level_counter += 1
		items_discovered.append_array(item_discovery_queue)
		call_deferred("_load_level", levels[level_counter])

func kill_player():
	# Kills the player, adds one to deaths, and emits the player death signal
	item_discovery_queue = []
	deaths += 1
	player_death.emit()
	player_dead = true
	
func bicheal_add_position(position):
	if !is_first_move:
		is_first_move = true
		first_move.emit()
	last_positions.append(position)
