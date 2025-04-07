class_name InputComponent
extends Node

var input_horizontal: float = 0.0
var input_jump: bool = false

func _process(_delta: float) -> void:
	input_horizontal = Input.get_axis(get_parent().inputs['left'],get_parent().inputs['right'])
	
func get_jump_input() -> bool:
	return Input.is_action_just_pressed(get_parent().inputs['jump'])	

func get_volley_input()-> bool:
	return Input.is_action_just_pressed(get_parent().inputs['volley'])

func get_smash_input()-> bool:
	return Input.is_action_just_pressed(get_parent().inputs['smash'])
	
func get_lob_input()-> bool:
	return Input.is_action_just_pressed(get_parent().inputs['lob'])
