extends Node
var config = ConfigFile.new()
var global_sfx = .8;
var global_music = .8;

	

func _onready() -> void:
	var err = config.load("res://SaveData/settings.cfg")
	
	if err != OK:
		_defaultinit()
		_save()
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"),global_music)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Sfx"),global_sfx)
	
func _save() -> void:
	config.save("res://SaveData/settings.cfg")
	
func _defaultinit() -> void:
	config.set_value("Settings","GlobalSfx", .8)
	config.set_value("Settings","GlobalMusic", .8)
	
	global_sfx=config.get_value("Settings", "GlobalSfx")
	global_music=config.get_value("Settings", "GlobalMusic")
	
func _setconfig(section: String, key: String, value: Variant) -> void:
	config.set_value(section, key, value)
