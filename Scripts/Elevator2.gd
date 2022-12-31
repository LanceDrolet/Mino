extends KinematicBody2D

onready var anim = get_node("AnimationPlayer")

func _on_Area2D_body_entered(body):
	if body.has_method("get_key") && body.get_key():
		anim.play("Default")
