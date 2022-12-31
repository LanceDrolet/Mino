class_name Hurtbox
extends Area2D


func _init():
	collision_mask = 8
	collision_layer = 0
	
func _ready():
	connect("area_entered", self, "_on_area_entered")
	
func _on_area_entered(hitbox: Hitbox):
	if hitbox != null:
		if owner.has_method("take_damage"):
			owner.take_damage(hitbox.Damage)
