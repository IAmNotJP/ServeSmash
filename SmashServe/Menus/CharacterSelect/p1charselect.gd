extends Control

@onready var next_scene: PackedScene = preload("res://Menus/CharacterSelect/p2charselect.tscn")

func _on_charlie_pressed() -> void:
	Globals.p1["Character"] = "Charlie"
	Globals.p1["Path"] = "res://Characters/Capybara/Charlie.tscn"
	confirm()


func _on_fireworm_pressed() -> void:
	Globals.p1["Character"] = "Fireworm"
	Globals.p1["Path"] = "res://Characters/Fireworm/Fireworm.tscn"
	confirm()


func _on_huntress_pressed() -> void:
	Globals.p1["Character"] = "Huntress"
	Globals.p1["Path"] = "res://Characters/Huntress/Huntress.tscn"
	confirm()


func _on_necromancer_pressed() -> void:
	Globals.p1["Character"] = "Necromancer"
	Globals.p1["Path"] = "res://Characters/Necromancer/Necromancer.tscn"
	confirm()

func _on_samurai_pressed() -> void:
	Globals.p1["Character"] = "Samurai"
	Globals.p1["Path"] = "res://Characters/Samurai/Samurai.tscn"
	confirm()

func _on_volleyballer_pressed() -> void:
	Globals.p1["Character"] = "Volleyballer"
	Globals.p1["Path"] = "res://Characters/Volleyballer/Volleyballer.tscn"
	confirm()


func _on_knight_pressed() -> void:
	Globals.p1["Character"] = "Knight"
	Globals.p1["Path"] = "res://Characters/Knight/Knight.tscn"
	confirm()


func _on_wolfman_pressed() -> void:
	Globals.p1["Character"] = "WolfMan"
	Globals.p1["Path"] = "res://Characters/Wolfman/Wolfman.tscn"
	confirm()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
	
func confirm() -> void:
	get_tree().change_scene_to_packed(next_scene)
