extends ParallaxLayer

export(float) var move_speed = -15

func _process(delta) -> void:
	self.motion_offset.x += move_speed * delta 

func _ready():
	pass
