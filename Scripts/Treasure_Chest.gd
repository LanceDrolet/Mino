class_name TreasureChest
extends Area2D

export var value := 50 
onready var sprite = get_node("mySprite")

func _ready():
	$mySprite.connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")

func _on_Treasure_Chest_body_entered(body):
	if body.has_method("receive_treasure"):
		sprite.play("collected")
		sprite.scale.x = 1
		sprite.scale.y = 1
		$coinSound.play()
		body.receive_treasure(value)
		


func _on_AnimatedSprite_animation_finished():
		queue_free()


