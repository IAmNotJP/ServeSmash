extends PanelContainer

@onready var exit: Button = $Exit

signal exit_options_menu

func _ready() -> void:
	exit.pressed.connect(on_exit_pressed)
	set_process(false)
	

func on_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(true)
