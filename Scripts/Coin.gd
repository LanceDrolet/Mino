extends Area2D


export var value := 10
onready var sprite = get_node("AnimatedSprite")


func _on_Coin_body_entered(body):
	if body.has_method("receive_treasure"):
		sprite.play("Collected")
		sprite.scale.x = 1
		sprite.scale.y = 1
		$coinSound.play()
		body.receive_treasure(value)



func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Collected":
		queue_free()
