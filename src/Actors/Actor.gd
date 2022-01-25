extends KinematicBody2D
class_name Actor

export var maxspeed: = Vector2(300.0, 500.0)
export var gravity: = 300.0
var velocity: = Vector2.ZERO
const UP = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, maxspeed.y)
	velocity = move_and_slide(velocity, UP)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-0.6 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0 
	)
