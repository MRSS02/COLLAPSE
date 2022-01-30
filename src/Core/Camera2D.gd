extends Camera2D

export var playerA: NodePath = ""
export var playerB: NodePath = ""
export var playerC: NodePath = ""
export var playerD: NodePath = ""
export var fixed: bool = false 
export var min_zoom = 1.00
var players: Array = [] 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	var max_distance: float = 0
	var average_position: Vector2 = Vector2.ZERO
	for i in players:
		for j in players: 
			max_distance = max(max_distance, i.global_position.distance_to(j.global_position))
		average_position += i.global_position
	if !fixed:   
		position = average_position / players.size()
		position.y = min(position.y, 0)
	if (SaveGame.number == 8):
		zoom = Vector2(max(1, max_distance/350), max(min_zoom, max_distance/350))
	else:
		zoom = Vector2(max(1, max_distance/1200), max(min_zoom, max_distance/1200))
# Called when the node enters the scene tree for the first time.
func _ready():
	if playerA != "": players.append(get_node(playerA))
	if playerB != "": players.append(get_node(playerB))
	if playerC != "": players.append(get_node(playerC))
	if playerD != "": players.append(get_node(playerD))
	# position.x = 5 
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
