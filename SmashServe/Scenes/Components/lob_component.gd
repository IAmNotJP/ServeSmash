class_name LobComponent
extends Node

@export var lob_hitbox: FlippableShape
@export var sprite: AnimatedSprite2D
var sound: AudioStream = load("res://SFX/hitHurt.wav")

func handle_hitbox(body: CharacterBody2D, want_to_hit: bool) -> void:
	if want_to_hit and body.is_on_floor() and get_parent().is_hitting == false:
		sprite.play("lob")
		$AudioStreamPlayer2D.stream = sound
		$AudioStreamPlayer2D.play()
		lob_hitbox.disabled = false
		get_parent().is_hitting = true
		
	if !body.is_on_floor():
		if sprite.animation == "lob":
			lob_hitbox.disabled = true
			get_parent().is_hitting = false
			
func animation_finished():
	lob_hitbox.disabled = true
	get_parent().is_hitting = false


func ball_hit(ball: RigidBody2D, vel: float):
	if lob_hitbox.disabled:
		return
	print("lob")
	var final_hit = Vector2(1.5, 0)
	final_hit = final_hit.rotated(-6 * PI / 16)
	if lob_hitbox.current_flip_value:
		final_hit.x *= -1
	final_hit *= vel * 1.25
	final_hit -= ball.linear_velocity
	print(final_hit)
	
	
	ball.apply_impulse(final_hit)
