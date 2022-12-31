class_name Player
extends Actor

const JUMPFORCE = 500
const SPAWN_X = 82
const SPAWN_Y = 360
var has_key = false
var has_gem = false

func _ready():
	facing_right = true
	state = MOVE
	animation_player = $AnimationPlayer

func _physics_process(delta):
	match state:
		MOVE:
			move(delta)
		ATTACK:
			attack(delta)
		HURT:
			pass

func attack(_delta):
	$AnimationPlayer.play("attacking")

func take_damage(damage):
	if !dead:
		state = HURT
		hitpoints -= damage
		$Sounds/hurtSound.play()
		$AnimationPlayer.play("hurt")

func hurt_finished():
	if hitpoints < 1:
		die()
	else: state = MOVE

func move(delta):
	if Input.is_action_pressed("sprint"):
		motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	else: motion.x = clamp(motion.x, -WALKSPEED, WALKSPEED)
	
	if !dead:
		if Input.is_action_pressed("ui_right"):
			animate_walking(Right, delta)
			if !$Sounds/walkSound.playing && is_on_floor():
				$Sounds/walkSound.play()
		elif Input.is_action_pressed("ui_left"):
			animate_walking(Left, delta)
			if !$Sounds/walkSound.playing && is_on_floor():
				$Sounds/walkSound.play()
		else: 
			motion.x = lerp(motion.x, 0, 0.2)
			$AnimationPlayer.play("Idle")
			
		if Input.is_action_pressed("Jump"):
			if is_on_floor():
				motion.y = -JUMPFORCE
				$Sounds/jumpSound.play()
				$AnimationPlayer.play("Jumping")
			
		motion = move_and_slide(motion, FLOOR_NORMAL)
		if Input.is_action_just_pressed("attack"):
			state = ATTACK
			
		if position.y > 4000:
			die()

func die():
	dead = true
	$RespawnTimer.start()
	$AnimationPlayer.play("die")
	$Sounds/deathSound.play()

func _on_RespawnTimer_timeout():
	dead = false
	hitpoints = 50
	state = MOVE
	position.x = SPAWN_X
	position.y = SPAWN_Y

func receive_treasure(value):
	Global.increase_score(value)
	
func set_key(_key: bool):
	has_key = _key
	Global.set_key(_key)
	
func get_key() -> bool:
	return has_key
	
func set_gem(_gem: bool):
	has_gem = _gem
	Global.set_gem(_gem)
	
func get_gem() -> bool:
	return has_gem
	
