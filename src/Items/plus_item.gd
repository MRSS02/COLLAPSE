extends Area2D

var plus = preload("res://assets/sprites/plus.png")

func _on_plus_item_body_entered(body: Node) -> void:
	if body.has_method("set_orientation"):
		body.set_orientation(1)
		body.set_collision_mask_bit(4, true)
		body.set_collision_mask_bit(5, false)
		body.get_node("sprite").set_texture(plus)
