class_name LobComponent
extends Node

@export var lob_hitbox: FlippableShape
@export var sprite: AnimatedSprite2D

func handle_hitbox(body: CharacterBody2D, want_to_hit: bool) -> void:
	if want_to_hit and body.is_on_floor() and get_parent().is_hitting == false:
		sprite.play("lob")
		lob_hitbox.disabled = false
		get_parent().is_hitting = true
		
	if !body.is_on_floor():
		if sprite.animation == "lob":
			lob_hitbox.disabled = true
			get_parent().is_hitting = false
			
func animation_finished():
	lob_hitbox.disabled = true
	get_parent().is_hitting = false


func ball_hit(ball: RigidBody2D):
	if lob_hitbox.disabled:
		return
	print("lob")
	
	ball.apply_impulse(Vector2(0, 100))
