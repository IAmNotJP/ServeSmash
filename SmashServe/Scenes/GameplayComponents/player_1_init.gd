extends Node2D


@export_subgroup("Settings")

@export var enabled: bool
@export var positionx: float = 370.0
@export var positiony: float = 778.0

var player_stats = {
	"Hits": 0,
	"Swings": 0
}

var path = Globals.p1["Path"]

@export var inputs = {
	"up": 'p1up',
	"down": 'p1down',
	"left": 'p1left',
	"right": 'p1right',
	"jump": 'p1jump',
	"volley": 'p1volley',
	"smash": 'p1smash',
	"lob": 'p1lob',
}

func _ready() -> void:
	print("path")
	var scene = load(path)
	add_child(scene.instantiate())
