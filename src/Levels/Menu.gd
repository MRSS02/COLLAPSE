extends Node

var next_level = "res://src/Levels/level1.tscn"

func _ready():
	MusicController.play_menu_music()

func _process(delta):
	if Input.is_action_just_pressed("jump") || Input.is_action_just_pressed("start"):
		MusicController.play_game_music()
		GlobalParallaxBackground.get_node("City").move_speed = 0
		get_tree().change_scene(next_level)
