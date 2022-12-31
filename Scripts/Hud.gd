extends CanvasLayer

onready var scoreLabel = get_node("HBoxContainer/ScoreLabel")
onready var gem = get_node("HBoxContainer/Gem")
onready var key = get_node("HBoxContainer/Key02")
	
func _process(delta):
	scoreLabel.text = str(Global.get_score())
	gem.visible = Global.get_gem()
	key.visible = Global.get_key()
	
	

