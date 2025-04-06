extends Area2D

var last_player



func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		last_player = area.get_parent()
		area.get_parent().volley_component.call_deferred("ball_hit", get_parent())
		area.get_parent().smash_component.call_deferred("ball_hit", get_parent())
		area.get_parent().lob_component.call_deferred("ball_hit", get_parent())


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body is CharacterBody2D and get_parent().linear_velocity.length() > 100:
		body.call_deferred("die")
	pass # Replace with function body.
