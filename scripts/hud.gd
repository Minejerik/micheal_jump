extends CanvasLayer


func _ready() -> void:
	$item_label/AnimationPlayer.play("RESET")
	DM.item_picked_up.connect(handle_new_item)


func handle_new_item(item_name):
	print(IM.ITEM_NAMES[item_name])
	$item_label.text = IM.ITEM_NAMES[item_name] + " Collected!"
	$item_label/AnimationPlayer.play("pop_up")
	$pop_down_timer.start()


func _on_pop_down_timer_timeout() -> void:
	$item_label/AnimationPlayer.play("pop_down")
