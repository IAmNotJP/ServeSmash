extends Control

@onready var asp: AudioStreamPlayer = $AudioStreamPlayer
@onready var logo: Sprite2D = $CenterContainer/Sprite2D
@onready var animation_player: AnimationPlayer = $CenterContainer/Sprite2D/AnimationPlayer
@onready var next_scene: PackedScene = preload("res://Menus/CharacterSelect/p1charselect.tscn")
@onready var options_menu: PanelContainer = $OptionsMenu


func _ready():
	logo.scale = Vector2(0.245, 0.245)  # Shrinks sprite to 50% of original size
	animation_player.play("flash")
	options_menu.exit_options_menu.connect(on_exit_options_menu)




func on_exit_options_menu() -> void:
	options_menu.hide()
	options_menu.set_process(false)


func _on_texture_button_1_pressed() -> void:
	asp.stop()
	get_tree().change_scene_to_packed(next_scene)
	


func _on_texture_button_2_pressed() -> void:
	options_menu.show()
	options_menu.set_process(true)
	


func _on_texture_button_3_pressed() -> void:
	get_tree().quit()
