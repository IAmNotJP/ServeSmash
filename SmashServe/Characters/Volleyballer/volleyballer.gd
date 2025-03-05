extends CharacterBody2D

const UP = Vector2(0,-1)
const SPEED = 80
const JUMP_VELOCITY = -400.0
var motion = Vector2()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_pressed("right"):
		motion.x = SPEED
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	else:
		motion.x =0
		
