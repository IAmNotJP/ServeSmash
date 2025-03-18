class_name JumpComponent
extends Node

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

var jump_velocity : float = ((2.0 * jump_height)/ jump_time_to_peak) * -1.0
var jump_gravity :  float = ((-2.0 * jump_height)/ (jump_time_to_peak * jump_time_to_peak)) * -1.0
var fall_gravity : float = ((-2.0 * jump_height)/ (jump_time_to_descent * jump_time_to_descent)) * -1.0

func handle_jump(body: CharacterBody2D) -> void:
	
