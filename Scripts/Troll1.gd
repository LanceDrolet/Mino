class_name Troll3
extends Enemy

func _ready():
	state = MOVE

func _physics_process(delta):
	match state:
		MOVE:
			move(delta)
		ATTACK:
			attack()
		HURT:
			pass
	
func move(delta):
	if !dead:
		$AnimationPlayer.play("walk")
		
		var found_edge = not $EdgeDetectLeft.is_colliding() or not $EdgeDetectRight.is_colliding()
		
		if found_edge || is_on_wall():
			motion.x *= -1
			facing_right = !facing_right
		if facing_right:
			motion.x += ACCEL * delta
		else: motion.x -= ACCEL * delta

	move_and_slide(motion, FLOOR_NORMAL)

func attack():
	$AnimationPlayer.play("attack")
		
func die():
	dead = true
	var shape = find_node("CollisionShape2D")
	shape.free()
	$AnimationPlayer.play("die")
	
func take_damage(damage):
	hitpoints -= damage
	state = HURT
	$hurtSound.play()
	$AnimationPlayer.play("Hurt")
	
func hurt_finished():
	if hitpoints < 1:
		die()
	else: state = MOVE

func lay_dead():
	set_physics_process(false)
	$deathSound.play()
	$DeathTimer.start()

func _on_DeathTimer_timeout():
	queue_free()

func _on_PlayerDetect_body_entered(body: Player):
	if body != null && !body.dead:
		state = ATTACK
		
