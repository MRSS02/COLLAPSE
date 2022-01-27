extends Node

var in_shock = 0
export var players = 2

func _physics_process(delta: float) -> void:
	if players == in_shock:
		get_tree().change_scene("res://src/Levels/level2.tscn")
