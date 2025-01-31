extends Button

func _ready() -> void:
	set_process_input(true)
	process_mode = Node.PROCESS_MODE_ALWAYS

func _pressed() -> void:
	if name == "StartButton":
		Global.set_state("start_time", Time.get_ticks_msec())
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	elif name == "ResumeButton":
		Global.toggle_pause()
	elif name == "ExitButton":
		get_tree().quit()
