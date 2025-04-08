extends Control

var character_folder_paths = {
	"charlie" : "res://Characters/Capybara/",
	"knight" : "res://Characters/Knight/",
	"samurai" : "res://Characters/Samurai/",
	"volleyballer" : "res://Characters/Volleyballer/"
}

var charload1
var charload2

var char_select_info = {
	
}

var p1selects = {
	"enabled": false,
	"lockedin": false,
	"selectedchar": null
}

var p2selects = {
	"enabled": false,
	"lockedin": false,
	"selectedchar": null
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func characterload(p1selects: Dictionary) -> void:
	if p1selects["enabled"] == true:
		if p1selects["lockedin"] == true:
			charload1 = load(p1selects["selectedchar"]).instance()
