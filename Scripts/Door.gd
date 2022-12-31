class_name door_of_enchantment
extends Node2D

onready var shape = get_node("Door/DoorShape")
onready var player = get_node("AnimationPlayer")
onready var doorLabel = get_node("Door/CanvasLayer/Label")

func _ready():
	shape.disabled = true
	doorLabel.visible = false

func door_visible():
	shape.disabled = false


func _on_Sign_body_entered(body):
	if shape.disabled:
		if body.has_method("get_gem") && body.get_gem():
			player.play("Appear")
		else: $Sign/CanvasLayer.visible = true


func _on_Sign_body_exited(body):
	$Sign/CanvasLayer.visible = false


func _on_Door_body_entered(body):
	if body.has_method("get_gem") && body.get_gem():
		doorLabel.visible = true
		
