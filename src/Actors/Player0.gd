extends Actor

func _physics_process(delta: float) -> void:
	var direction: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-1.0 if Input.is_action_just_pressed("jump") else 0.0 
	)
	var orientation = 1 
	velocity.x = (maxspeed.x) * direction.x * orientation 	
	velocity.y += (maxspeed.y) * direction.y
	print(direction.x) 
