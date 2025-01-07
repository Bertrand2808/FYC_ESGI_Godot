extends Node

var score_coins = 0
var score_stars = 0

@onready var score_label: Label = $ScoreLabel

@onready var score_ui: Node = $"../Player/GUI/ScoreUi"

func add_coin():
	score_coins += 1
	score_ui.refresh_ui(score_coins,score_stars)
	score_label.text = "Congrats ! You collected " + str(score_coins) + " coins!"

func add_star():
	score_stars += 1
	score_ui.refresh_ui(score_coins,score_stars)
