extends Label

var score = 0
func _process(delta: float) -> void:
	if score != get_parent().p1_score and get_parent().p1_score != null:
		score = get_parent().p1_score
		text = str("P1: ",score)
	
