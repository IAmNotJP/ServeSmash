extends Node2D

var path = Globals.stage["Path"]

func _ready() -> void:
	var scene = load(path)
	add_child(scene.instantiate())
