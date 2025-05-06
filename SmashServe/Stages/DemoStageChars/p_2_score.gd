extends Label

var score = 0
func _process(delta: float) -> void:
	if score != get_parent().p2_score and get_parent().p2_score != null:
		score = get_parent().p2_score
		text = str("P2: ",score)
