class_name VolleyComponent
extends Node

@export var volley_hitbox: FlippableShape
@export var sprite: AnimatedSprite2D

func handle_hitbox(body: CharacterBody2D, want_to_hit: bool) -> void:
	if want_to_hit and body.is_on_floor() and get_parent().is_hitting == false:
		sprite.play("volley")
		volley_hitbox.disabled = false
		get_parent().is_hitting = true
		
	if !body.is_on_floor():
		if sprite.animation == "lob":
			volley_hitbox.disabled = true
			get_parent().is_hitting = false
		
func animation_finished():

	volley_hitbox.disabled = true
	get_parent().is_hitting = false
