class_name Actor
extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP
const ACCEL = 900

export var hitpoints := 30

var state
enum {MOVE, ATTACK, DEAD, HURT}
enum {Right, Left, Up, Down}

var dead = false
var facing_right
var motion = Vector2.ZERO

export var WALKSPEED = 200
export var MAXSPEED = 350

var animation_player

onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

func _ready():
	facing_right = true



func _physics_process(delta):
	motion.y += gravity * delta
	
	if facing_right:
		$Sprite.scale.x = 1
	else: $Sprite.scale.x = -1
	

	
func animate_walking(direction, delta):
	match direction:
		Right:
			motion.x += ACCEL * delta
			facing_right = true
		Left:	
			motion.x -= ACCEL * delta
			facing_right = false
	if is_on_floor():
		animation_player.play("Walking")

func attack_finished():
	state = MOVE
