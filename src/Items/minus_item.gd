extends Area2D

var texture = preload("res://src/Actors/MinusGuy.tres")

func _on_minus_body_entered(body: Node) -> void:
	if body.has_method("set_orientation"):
		body.set_orientation(-1)
		body.set_collision_mask_bit(4, false)
		body.set_collision_mask_bit(5, true)
		body.get_node("AnimatedSprite").set_texture(texture)
