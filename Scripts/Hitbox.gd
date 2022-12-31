class_name Hitbox
extends Area2D

export var Damage := 10

func _init():
	collision_layer = 8
	collision_mask = 0

