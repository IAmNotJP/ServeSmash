extends Label

@onready var p1score = get_parent().p1_score
@onready var p1games = get_parent().p1_games
@onready var p2score = get_parent().p2_score
@onready var p2games = get_parent().p2_games

func _process(delta: float) -> void:
	
	if get_parent().scored:
		p1score = get_parent().p1_score
		p1games = get_parent().p1_games
		p2score = get_parent().p2_score
		p2games = get_parent().p2_games
		visible = true
		
		if(get_parent().p1_score > 3):
			if p1games > 1:
				text = "P1 Wins!"
				await get_tree().create_timer(5).timeout
			else:
				text = "P1 Game!"
				await get_tree().create_timer(2).timeout
		elif(get_parent().p2_score > 3):
			if p2games > 1:
				text = "P2 Wins!"
				await get_tree().create_timer(5).timeout
			else:
				text = "P2 Game!"
				await get_tree().create_timer(2).timeout

		visible = false
		
