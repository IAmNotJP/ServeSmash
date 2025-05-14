extends Node2D

@export var p1_ball_spawn: Vector2
@export var p2_ball_spawn: Vector2
@export var half_x: float

@onready var p1 = $"../Player1Init".get_child(0)
@onready var p2 = $"../Player2Init".get_child(0)
@onready var p_1_games: Label = $P1Games
@onready var p_2_games: Label = $P2Games

@onready var left_is_p1 = p1.position.x < DisplayServer.window_get_size(0).x / 2


var total_games;
var total_sets;
var total_matches;
var p1_score = 0
var p2_score = 0
var p1_games = 0
var p2_games = 0
var p1_matches;
var p2_matches;
var resetting = false
var scored = false
var p1_serves = RandomNumberGenerator.new().randf() < 0.5

func ball_reset(ball: RigidBody2D):
	Engine.time_scale = 0.1 # slowdown effects are cool right?
	await get_tree().create_timer(5.0, true, false, true).timeout
	Engine.time_scale = 1
	scored = false
	
	resetting = true
	if p1_serves:
		ball.global_position = p1_ball_spawn
	else:
		ball.global_position = p2_ball_spawn
	p1_serves = not p1_serves
	ball.linear_velocity = Vector2(0, 0)
	ball.get_node("Hitbox").call("reset_internals")
	ball.freeze = true
	await get_tree().create_timer(2.5, true, false, true).timeout
	ball.freeze = false
	resetting = false
	

func _on_ball_score(last_hitter: CharacterBody2D, ball: RigidBody2D) -> void:
	if scored:
		return
	scored = true
	var ball_x = ball.global_position.x
	if last_hitter == p1:
		if (left_is_p1 and ball_x < half_x) or ((not left_is_p1) and ball_x > half_x):
			p2_score += 1 # you didn't hit the ball over the net, very sad
		else:
			p1_score += 1
	elif last_hitter == p2:
		if (left_is_p1 and ball_x > half_x) or ((not left_is_p1) and ball_x < half_x):
			p1_score += 1
		else:
			p2_score += 1
	else:
		print("Player wins a point but somehow it's neither P1 or P2.")
	
	
	if p1_score > 3:
		if p1_games == 1:
			win(true)
		else:
			win_game(true)
			ball_reset(ball)
	elif p2_score > 3:
		if p1_games == 1:
			win(false)
		else:
			win_game(false)
			ball_reset(ball)
	else:
		print("Current score: ", p1_score, "-", p2_score) # display the score
		ball_reset(ball)
		

func _input(ev):
	if Input.is_action_just_pressed("Reset"):
		Engine.time_scale = 1
		get_tree().reload_current_scene()

func win_game(p1_won: bool) -> void:
	if p1_won: # Do the displaying of player 1 or 2 winning
		print("Player 1 won the game!")
		p1_games += 1
		p_1_games.text = "◍○"
	else: 
		print("Player 2 won the game!")
		p2_games += 1
		p_2_games.text = "○◍"
	
	Engine.time_scale = 0.1
	await get_tree().create_timer(5.0, true, false, true).timeout
	Engine.time_scale = 1

	p1_score = 0
	p2_score = 0


func win(p1_won: bool) -> void:
	if p1_won: # Do the displaying of player 1 or 2 winning
		print("Player 1 won the set!")
		p1_games += 1
		p_1_games.text = "◍◍"
	else: 
		print("Player 2 won the set!")
		p2_games += 1
		p_2_games.text = "◍◍"
	
	Engine.time_scale = 0.1
	await get_tree().create_timer(5.0, true, false, true).timeout
	Engine.time_scale = 1
	
	# wipe to black or something idk
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
