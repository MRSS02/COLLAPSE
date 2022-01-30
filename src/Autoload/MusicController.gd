extends Node

var menu_music = preload("res://assets/audio/music/music.ogg")
var game_music = preload("res://assets/audio/music/game.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_menu_music():
	$Music.stream = menu_music
	$Music.play()

func play_game_music():
	$Music.stream = game_music
	$Music.play()
