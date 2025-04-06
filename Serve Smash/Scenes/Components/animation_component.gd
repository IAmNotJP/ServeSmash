class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

func handle_horizonal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return
	
	sprite.flipped = false if move_direction > 0 else true

func handle_move_animation(move_direction: float) -> void:
	handle_horizonal_flip(move_direction)
	if move_direction != 0 and get_parent().is_hitting == false and get_parent().is_airbourne == false:
		get_parent().is_running = true
		sprite.play('run')
	elif get_parent().is_hitting == false and get_parent().is_airbourne == false:
		get_parent().is_running = false
		sprite.play('idle')
	
