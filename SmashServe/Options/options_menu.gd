extends PanelContainer

@onready var exit: Button = $Exit
@onready var master_volume_slider: HSlider = $TabContainer/Sound/MarginContainer/VBoxContainer/MasterLabel/MasterVolumeSlider
@onready var music_volume_slider: HSlider = $TabContainer/Sound/MarginContainer/VBoxContainer/MusicLabel/MusicVolumeSlider
@onready var sfx_volume_slider: HSlider = $TabContainer/Sound/MarginContainer/VBoxContainer/SFXLabel/SFXVolumeSlider

signal exit_options_menu

func _ready() -> void:
	master_volume_slider.set("bus_index", 0)
	music_volume_slider.set("bus_index", 2)
	sfx_volume_slider.set("bus_index", 1)
	exit.pressed.connect(on_exit_pressed)
	set_process(false)
	

func on_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(true)
