extends Node2D


@export_subgroup("Settings")

@export var enabled: bool
@export var positionx: float
@export var positiony: float

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
