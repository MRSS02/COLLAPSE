extends Node

var next_level = "res://src/Levels/level1.tscn"
onready var selection = get_node("NEW_GAME_SELECTED")




func _ready():
	selection.show()
	MusicController.play_menu_music()

func do(selection):
	if selection.name == "NEW_GAME_SELECTED":
		MusicController.play_game_music()
		GlobalParallaxBackground.get_node("City").move_speed = 0
		get_tree().change_scene(next_level)

func change_selection(button):
	if button == "up":
		if selection.name != "NEW_GAME_SELECTED":
			selection.hide()
		if selection.name == "LOAD_SAVE_SELECTED":
			selection = get_node("NEW_GAME_SELECTED")
		else: if selection.name == "CHANGE_CONTROLS_SELECTED":
			selection = get_node("LOAD_SAVE_SELECTED")
	else:
		if selection.name != "CHANGE_CONTROLS_SELECTED":
			selection.hide()
		if selection.name == "LOAD_SAVE_SELECTED":
			selection = get_node("CHANGE_CONTROLS_SELECTED")
		else: if selection.name == "NEW_GAME_SELECTED":
			selection = get_node("LOAD_SAVE_SELECTED")
	selection.show()

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		do(selection)
	if Input.is_action_just_pressed("ui_up"):
		change_selection("up")
	if Input.is_action_just_pressed("ui_down"):
		change_selection("down")
