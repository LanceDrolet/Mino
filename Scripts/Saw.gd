extends Node2D

export var damage :=100

func _ready():
	$AnimationPlayer.play("Default")

func _on_Area2D_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
