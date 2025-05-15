extends Node2D

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true		
			
		else:
			get_tree().paused = false
