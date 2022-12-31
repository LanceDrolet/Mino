class_name GemChest
extends Area2D

onready var aniPlayer = get_node("AnimationPlayer")

func _on_GemChest_body_entered(body):
	if body.has_method("get_key"):
		if body.get_key():
			body.set_gem(true)
			body.set_key(false)
			aniPlayer.play("diamond")
	
func animation_finished():
	queue_free()
