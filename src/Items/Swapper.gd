extends Area2D

func body_entered(body):
	print("body.nameaaaa")
	if body.is_in_group("Player"):
		body.set_orientation(body.orientation)
