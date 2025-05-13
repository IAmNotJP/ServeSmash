extends Label

@onready var p1score = get_parent().p1_score

@onready var p2score = get_parent().p2_score


func _process(delta: float) -> void:
	
	if get_parent().scored:
		visible = true
		if(get_parent().p1_score > 3):
			text = "P1 Wins!"
			p1score = get_parent().p1_score
			await get_tree().create_timer(5).timeout
		#elif(get_parent().p1_score > p1score):
			#text = "P1 Scored!"
			#p1score = get_parent().p1_score
			#await get_tree().create_timer(3).timeout
		
		if(get_parent().p2_score > 3):
			text = "P2 Wins!"
			p2score = get_parent().p2_score
			await get_tree().create_timer(5).timeout
		#elif(get_parent().p2_score > p2score):
			#text = "P2 Scored!"
			#p2score = get_parent().p2_score
			#await get_tree().create_timer(3).timeout
		
		visible = false
		
