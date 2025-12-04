extends Area2D

# The item ID when collected, used for tracking
@export var ITEM_ID: String = "NULL"
# The texture of the item
@export var ITEM_TEXTURE: Texture2D

# If this item was picked up or not
var picked_up: bool = false

func _ready() -> void:
	$Sprite2D.set_texture(ITEM_TEXTURE)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && !picked_up:
		DM.pick_up(ITEM_ID)
		picked_up = true
		
		$Sprite2D.self_modulate = Color("64646444")
