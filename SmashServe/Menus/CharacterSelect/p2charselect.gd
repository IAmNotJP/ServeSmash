extends Control

@onready var next_scene: PackedScene = preload("res://Stages/DemoStageChars/demo.tscn")
@onready var loading: Label = $Loading

func _ready() -> void:
	loading.hide()

func _on_charlie_pressed() -> void:
	Globals.p2["Character"] = "Charlie"
	Globals.p2["Path"] = "res://Characters/Capybara/Charlie.tscn"
	confirm()


func _on_fireworm_pressed() -> void:
	Globals.p2["Character"] = "Fireworm"
	Globals.p2["Path"] = "res://Characters/Fireworm/Fireworm.tscn"
	confirm()


func _on_huntress_pressed() -> void:
	Globals.p2["Character"] = "Huntress"
	Globals.p2["Path"] = "res://Characters/Huntress/Huntress.tscn"
	confirm()


func _on_necromancer_pressed() -> void:
	Globals.p2["Character"] = "Necromancer"
	Globals.p2["Path"] = "res://Characters/Necromancer/Necromancer.tscn"
	confirm()



func _on_samurai_pressed() -> void:
	Globals.p2["Character"] = "Samurai"
	Globals.p2["Path"] = "res://Characters/Samurai/Samurai.tscn"
	confirm()


func _on_volleyballer_pressed() -> void:
	Globals.p2["Character"] = "Volleyballer"
	Globals.p2["Path"] = "res://Characters/Volleyballer/Volleyballer.tscn"
	confirm()


func _on_knight_pressed() -> void:
	Globals.p2["Character"] = "Knight"
	Globals.p2["Path"] = "res://Characters/Knight/Knight.tscn"
	confirm()


func _on_wolfman_pressed() -> void:
	Globals.p2["Character"] = "WolfMan"
	Globals.p2["Path"] = "res://Characters/Wolfman/Wolfman.tscn"
	confirm()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/CharacterSelect/p1charselect.tscn")
	
	
func confirm() -> void:
	loading.show()
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	get_tree().change_scene_to_packed(next_scene)
