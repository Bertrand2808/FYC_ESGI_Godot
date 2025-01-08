extends Node

var is_paused = false

func _ready() -> void:
	print("Global script is ready.")
	set_process(true)  # Ensure global script processes even when paused
	process_mode = Node.PROCESS_MODE_ALWAYS  # Keep processing during pause

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):  # "ui_cancel" is mapped to Esc by default
		toggle_pause()

func toggle_pause() -> void:
	var pause_screen = get_tree().get_current_scene().get_node("Player/GUI/PauseScreen")

	if pause_screen:
		if is_paused:
			pause_screen.visible = false
			is_paused = false 
			get_tree().paused = false
		else:
			pause_screen.visible = true
			is_paused = true
			get_tree().paused = true
	else:
		print("PauseScreen node not found!")
