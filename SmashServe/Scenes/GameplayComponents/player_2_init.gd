extends Node2D


@export_subgroup("Settings")

@export var enabled: bool
@export var positionx: float = 1500.0
@export var positiony: float = 830.0

var path = Globals.p2["Path"]

@export var inputs = {
	"up": 'p2up',
	"down": 'p2down',
	"left": 'p2left',
	"right": 'p2right',
	"jump": 'p2jump',
	"volley": 'p2volley',
	"smash": 'p2smash',
	"lob": 'p2lob',
}

func _ready() -> void:
	print("path")
	var scene = load(path)
	add_child(scene.instantiate())
