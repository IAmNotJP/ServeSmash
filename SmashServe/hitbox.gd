extends Area2D

const MVEL_MULT = 1.05

var last_player
var max_velocity = 500




func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		max_velocity *= MVEL_MULT
		last_player = area.get_parent()
		area.get_parent().volley_component.call_deferred("ball_hit", get_parent(), max_velocity)
		area.get_parent().smash_component.call_deferred("ball_hit", get_parent(), max_velocity)
		area.get_parent().lob_component.call_deferred("ball_hit", get_parent(), max_velocity)


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body is CharacterBody2D and get_parent().linear_velocity.length() > 100 and not body == last_player:
		body.call_deferred("die")
	pass # Replace with function body.
