extends Actor
class_name Player

export var orientation: = 1 
var show = 1;

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-0.6 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0 
	)

func set_orientation(value: int) -> void:
	orientation = value

func eliminate(value) -> void:
	value.hide()
	value.get_node("CollisionShape2D").disabled = true 

func _physics_process(delta: float) -> void:
	var direction: = get_direction() 
	velocity.x = (maxspeed.x) * direction.x * orientation
	velocity.y += (maxspeed.y) * direction.y
	#print(direction.x, is_on_floor()) 
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print(collision.collider.name)
		if collision.collider.has_method("set_orientation") && orientation == 1 && collision.collider.orientation == -1:
			get_parent().in_shock += 2
			eliminate(collision.collider)
			eliminate(self)
