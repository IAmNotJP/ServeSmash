extends RigidBody2D

signal score(last_hitter: CharacterBody2D, ball_x: float)



func _on_hitbox_score(last_hitter: CharacterBody2D, ball: RigidBody2D) -> void:
	score.emit(last_hitter, ball)
