extends Node2D


@export_subgroup("Settings")

@export var enabled: bool
@export var positionx: float
@export var positiony: float

var path

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
	var scene = load(path)
	var instance = scene.instanciate()
	add_child(instance)
