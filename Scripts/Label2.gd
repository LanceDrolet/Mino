extends Label


func _process(_delta):
	self.text = str(Global.get_score())

