extends Label

@onready var p1score = get_parent().p1_score

@onready var p2score = get_parent().p2_score


func _process(delta: float) -> void:
	
	if get_parent().scored:
		visible = true
		if(get_parent().p1_score > p1score):
			text = "P1 Scored!"
			p1score = get_parent().p1_score
			await get_tree().create_timer(2).timeout
		if(get_parent().p2_score > p2score):
			text = "P2 Scored!"
			p2score = get_parent().p2_score
			await get_tree().create_timer(2).timeout
		text = "Resetting..."
		await get_tree().create_timer(2).timeout
		
		visible = false
		
