extends Control

var current_player := 1

func _ready():
	GameState.is_p1_ready = false
	GameState.is_p2_ready = false
	current_player = 1

func _select_character_for_current_player(character_id: String):
	var character_paths = {
		"Char1": "res://Characters/Char1.tscn",
		"Char2": "res://Characters/Char2.tscn",
		"Char3": "res://Characters/Char3.tscn",
		"Char4": "res://Characters/Char4.tscn",
		"Char5": "res://Characters/Char5.tscn",
		"Char6": "res://Characters/Char6.tscn",
		"Char7": "res://Characters/Char7.tscn",
		"Char8": "res://Characters/Char8.tscn",
		"Char9": "res://Characters/Char9.tscn",
		"Char10": "res://Characters/Char10.tscn",
		"Char11": "res://Characters/Char11.tscn",
		"Char12": "res://Characters/Char12.tscn",
	}

	var selected_scene = load(character_paths[character_id])
	# 🔒 LOCK-IN VISUAL EFFECT
	var button_name = "Button_" + character_id
	var button = $CharacterGrid.get_node(button_name)  # adjust path as needed
	button.disabled = true  # disables clicking
	button.text = character_id + " LOCKED!"

	if current_player == 1:
		GameState.p1_character_scene = selected_scene
		GameState.is_p1_ready = true
		current_player = 2
		print("Player 1 selected", character_id)
	elif current_player == 2:
		GameState.p2_character_scene = selected_scene
		GameState.is_p2_ready = true
		print("Player 2 selected", character_id)

	if GameState.is_p1_ready and GameState.is_p2_ready:
		get_tree().change_scene_to_file("res://Stages/Space Stage.tscn")



func _on_char1_button_pressed():
	_select_character_for_current_player("Char1")

func _on_char2_button_pressed():
	_select_character_for_current_player("Char2")

func _on_char3_button_pressed():
	_select_character_for_current_player("Char3")

func _on_char4_button_pressed():
	_select_character_for_current_player("Char4")

func _on_char5_button_pressed():
	_select_character_for_current_player("Char5")

func _on_char6_button_pressed():
	_select_character_for_current_player("Char6")

func _on_char7_button_pressed():
	_select_character_for_current_player("Char7")

func _on_char8_button_pressed():
	_select_character_for_current_player("Char8")

func _on_char9_button_pressed():
	_select_character_for_current_player("Char9")

func _on_char10_button_pressed():
	_select_character_for_current_player("Char10")

func _on_char11_button_pressed():
	_select_character_for_current_player("Char11")

func _on_char12_button_pressed():
	_select_character_for_current_player("Char12")
