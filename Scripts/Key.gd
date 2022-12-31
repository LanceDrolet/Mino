class_name Key
extends Area2D




func _on_Key_body_entered(body):
	if body.has_method("set_key"):
		body.set_key(true)
		queue_free()
