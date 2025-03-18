class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

func handle_move_animation(move_direction: float) -> void:
	if move_direction != 0:
		sprite.play('run')
	else:
		sprite.play('idle')
	print(move_direction)
	
