class_name Enemy
extends Actor


func _physics_process(_delta):
	motion.x = clamp(motion.x, -WALKSPEED, WALKSPEED)
