extends Control

@onready var asp: AudioStreamPlayer = $AudioStreamPlayer
@onready var logo: Sprite2D = $CenterContainer/Sprite2D
@onready var flash_animation: AnimationPlayer = $CenterContainer/Sprite2D/AnimationPlayer

func _ready():
	logo.scale = Vector2(0.245, 0.245)  # Shrinks sprite to 50% of original size
	flash_animation.play("flash")


func _on_texture_button_1_pressed() -> void:
	asp.stop()
	get_tree().change_scene_to_file("res://Stages/Stage1.tscn")
	



func _on_texture_button_3_pressed() -> void:
	get_tree().quit()
