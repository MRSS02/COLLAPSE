extends Node

var next_level = "res://src/Levels/level1.tscn"

onready var city = get_node("ParallaxBackground/City")

func _ready():
	city.move_speed = -4
	MusicController.play_menu_music()

func _process(delta):
	if Input.is_action_just_pressed("jump") || Input.is_action_just_pressed("start"):
		MusicController.play_game_music()
		city.move_speed = 0
		get_tree().change_scene(next_level)
