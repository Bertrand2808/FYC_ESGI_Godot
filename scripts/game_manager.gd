extends Node

var score_coins = 0
var score_stars = 0

@onready var score_ui: Node = $"../Player/GUI/ScoreUi"

func _ready() -> void:
	Global.set_state("score_coins", score_coins)
	Global.set_state("score_stars", score_stars)
		
func add_coin():
	score_coins += 1
	score_ui.refresh_ui(score_coins,score_stars)
	Global.set_state("score_coins", score_coins)

func add_star():
	score_stars += 1
	score_ui.refresh_ui(score_coins,score_stars)
	Global.set_state("score_stars", score_stars)
