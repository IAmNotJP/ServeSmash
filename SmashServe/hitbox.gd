extends Area2D

signal score(last_hitter: CharacterBody2D, ball: RigidBody2D)

const MVEL_MULT = 1.05
const GRAD_VEL_START = 750
const GRAD_VEL_END = 1500
const GRAD_VEL_END_START = 1000
const INIT_MAX_VEL = 500

var last_player: CharacterBody2D = null
var num_bounces = 0
var max_velocity = INIT_MAX_VEL

var prev_positions = []

func _process(_delta: float):
	prev_positions.push_front(global_position)
	if prev_positions.size() > 20:
		prev_positions.pop_back()
		
	for i in range(prev_positions.size()):
		get_node("../Line2D").set_point_position(i, (prev_positions[i] - global_position).rotated(-global_rotation))
	
	if get_parent().linear_velocity.length() > GRAD_VEL_START:
		var start_scaling_factor = clamp(get_parent().linear_velocity.length() - GRAD_VEL_START, 0, GRAD_VEL_END) / GRAD_VEL_END
		var end_scaling_factor = clamp(get_parent().linear_velocity.length() - GRAD_VEL_END_START, 0, GRAD_VEL_END) / GRAD_VEL_END
		
		var grad = Gradient.new()
		grad.set_color(0, Color.from_rgba8(128 + (128 * start_scaling_factor), 255 - (255 * start_scaling_factor), 0))
		grad.set_color(1, Color.from_rgba8(128 + (128 * end_scaling_factor), 255 - (255 * end_scaling_factor), 0))
		get_node("../Line2D").set_gradient(grad)
	else:
		get_node("../Line2D").set_gradient(null)
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		max_velocity *= MVEL_MULT
		if last_player != area.get_parent():
			num_bounces = 0
		last_player = area.get_parent()
		area.get_parent().volley_component.call_deferred("ball_hit", get_parent(), max_velocity)
		area.get_parent().smash_component.call_deferred("ball_hit", get_parent(), max_velocity)
		area.get_parent().lob_component.call_deferred("ball_hit", get_parent(), max_velocity)


func _on_body_entered(body: Node2D) -> void:
	#print(body)
	if body is not CharacterBody2D:
		num_bounces += 1
	if num_bounces >= 2 and last_player != null:
		score.emit(last_player, get_parent())
	pass # Replace with function body.


func reset_internals() -> void:
	print("RESETTING")
	num_bounces = 0
	max_velocity = INIT_MAX_VEL
	prev_positions = []
	var trail: Line2D = get_node("../Line2D")
	for i in range(trail.get_point_count()):
		trail.set_point_position(i, Vector2(0, 0))
	last_player = null
