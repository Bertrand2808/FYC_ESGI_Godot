extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel

@onready var score_ui: Node = $"../Player/GUI/ScoreUi"

func add_point():
	score += 1
	score_ui.refresh_ui(score)
	score_label.text = "Congrats ! You collected " + str(score) + " coins!"
