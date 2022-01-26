extends Actor

export var orientation: = 1 

func _physics_process(delta: float) -> void:
	var direction: = get_direction() 
	velocity.x = (maxspeed.x) * direction.x * orientation
	velocity.y += (maxspeed.y) * direction.y
	print(direction.x, is_on_floor()) 
