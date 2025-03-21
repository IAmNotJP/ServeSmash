class_name SmashComponent
extends Node

@export var smash_hitbox: FlippableShape
@export var sprite: AnimatedSprite2D

func handle_hitbox(body: CharacterBody2D, want_to_hit: bool) -> void:
	if want_to_hit and get_parent().is_airbourne == true and get_parent().is_hitting == false:
		sprite.play("smash")
		smash_hitbox.disabled = false
		get_parent().is_hitting = true
		
	if body.is_on_floor():
		if sprite.animation == "smash":
			smash_hitbox.disabled = true
			get_parent().is_hitting = false
		
		
func animation_finished():
	if sprite.animation == "smash":
		smash_hitbox.disabled = true
		get_parent().is_hitting = false
