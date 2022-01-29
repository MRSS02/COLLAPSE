extends Actor
class_name Player

export var orientation: = 1 
var facing_right = true
var walking = false
onready var _animated_sprite = $AnimatedSprite

func _ready() -> void:
	if orientation == 1:
		facing_right = true
	else:
		facing_right = false 

func _process(_delta):
	if Input.is_action_pressed("move_right"):
		walking = true
		if orientation == 1:
			facing_right = true
		else:
			facing_right = false 
	else: 
		if Input.is_action_pressed("move_left"):
			walking = true
			if orientation == 1:
				facing_right = false
			else:
				facing_right = true
		else:
			walking = false  
	if facing_right:
		if orientation == 1:
			if walking && is_on_floor():
				_animated_sprite.play("walk_right_plus")
			else:
				_animated_sprite.play("idle_right_plus")
		else:
<<<<<<< HEAD
			_animated_sprite.play("idle_right_minus") 
=======
			if walking && is_on_floor():
				_animated_sprite.play("walk_right_minus")
			else:
				_animated_sprite.play("idle_right_minus") 
		
>>>>>>> e9e7b752c6a108b6540bc04c2da6ab5f85e02382
	else:
		if orientation == 1:
			if walking && is_on_floor():
				_animated_sprite.play("walk_left_plus")
			else:
				_animated_sprite.play("idle_left_plus")
		else:
<<<<<<< HEAD
			_animated_sprite.play("idle_left_minus") 
	if get_tree().get_current_scene().get_name() == "LevelTemplate1":
		global_position.x= clamp(global_position.x,-617,619)
	if get_tree().get_current_scene().get_name() == "LevelTemplate2":
		global_position.x= clamp(global_position.x,-616,616)
	if get_tree().get_current_scene().get_name() == "LevelTemplate3":
		global_position.x= clamp(global_position.x,-474,490)
	if get_tree().get_current_scene().get_name() == "LevelTemplate4":
		global_position.x= clamp(global_position.x,-616,538)
=======
			if walking && is_on_floor():
				_animated_sprite.play("walk_left_minus")
			else:
				_animated_sprite.play("idle_left_minus") 

>>>>>>> e9e7b752c6a108b6540bc04c2da6ab5f85e02382
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
