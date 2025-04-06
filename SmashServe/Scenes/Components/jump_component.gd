class_name JumpComponent
extends Node

@export_subgroup("Settings")
@export var jump_velocity: float = -350.0
@export var sprite: AnimatedSprite2D

var is_jumping: bool = false
var is_falling: bool = false

var prevframe: float = 0
var currentframe: float = 0


func handle_jump(body: CharacterBody2D, want_to_jump: bool) -> void:
	prevframe = currentframe
	currentframe = body.velocity.y
	#print(body.velocity.y)
	if want_to_jump and body.is_on_floor():
		get_parent().is_airbourne = true
		body.velocity.y = jump_velocity
	
	if body.velocity.y < 0 and not body.is_on_floor() and is_jumping == false and get_parent().is_hitting == false:
		sprite.play("jump_launch")
		
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()

	
	if body.velocity.y == 0:
		get_parent().is_airbourne = false
		is_falling = is_jumping
		
	if (prevframe + currentframe) > 0 and not body.is_on_floor() and is_falling == false and get_parent().is_hitting == false:
		is_falling = true
		sprite.play("jump_land")
	
