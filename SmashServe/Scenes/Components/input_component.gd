class_name InputComponent
extends Node

var input_horizontal: float = 0.0


func _process(_delta: float) -> void:
	input_horizontal = Input.get_axis('p1left','p1right')
	
func get_jump_input() -> bool:
	return Input.is_action_just_pressed("p1jump")	

func get_volley_input()-> bool:
	return Input.is_action_just_pressed("p1volley")
