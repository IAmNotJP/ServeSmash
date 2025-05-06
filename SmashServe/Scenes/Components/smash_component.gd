class_name SmashComponent
extends Node

@export var smash_hitbox: FlippableShape
@export var sprite: AnimatedSprite2D

func handle_hitbox(body: CharacterBody2D, want_to_hit: bool) -> void:
	if want_to_hit and get_parent().is_airbourne == true and get_parent().is_hitting == false:
		sprite.play("smash")
		if body.velocity.y < 0:
			body.velocity.y = 500
		smash_hitbox.disabled = false
		get_parent().is_hitting = true
		
	if body.is_on_floor():
		if sprite.animation == "smash":
			smash_hitbox.disabled = true
			get_parent().is_hitting = false
		
		
func animation_finished():
	smash_hitbox.disabled = true
	get_parent().is_hitting = false

func ball_hit(ball: RigidBody2D, vel: float):
	if smash_hitbox.disabled:
		return
	print("smash")
	var final_hit = Vector2(1, 0)
	final_hit = final_hit.rotated(1 * PI / 16)
	if smash_hitbox.current_flip_value:
		final_hit.x *= -1
	final_hit *= vel * 2
	final_hit -= ball.linear_velocity
	print(final_hit)
	ball.apply_impulse(final_hit)
