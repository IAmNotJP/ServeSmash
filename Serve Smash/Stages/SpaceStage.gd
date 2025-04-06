extends Node2D

func _ready():
	var p1 = GameState.p1_character_scene.instantiate()
	var p2 = GameState.p2_character_scene.instantiate()

	p1.position = $P1Start.position
	p2.position = $P2Start.position

	add_child(p1)
	add_child(p2)
