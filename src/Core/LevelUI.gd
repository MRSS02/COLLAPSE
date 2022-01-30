extends CanvasLayer

export var set_number = "1"
export var set_name = "COLLAPSE!"

func _ready():
	get_node("StageName")._change_text(set_name)
	get_node("StageNumber")._change_text(set_number)
