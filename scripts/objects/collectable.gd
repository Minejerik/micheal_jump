extends Area2D

# The item ID when collected, used for tracking
@export var ITEM_ID: String = "NULL"
# The texture of the item
@export_file var ITEM_TEXTURE: String

# If this item was picked up or not
var picked_up: bool = false

func _ready() -> void:
	$Sprite2D.set_texture(ImageTexture.create_from_image(Image.load_from_file(ITEM_TEXTURE)))

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" && !picked_up:
		DM.pick_up(ITEM_ID)
		picked_up = true
		
		var tex: Image = $Sprite2D.get_texture().get_image()
		
		tex.rotate_90(CLOCKWISE)
		
		$Sprite2D.set_texture(ImageTexture.create_from_image(tex))
