extends Node

@onready var game_manager: Node = %GameManager
@onready var score_label_coin: Label = $PanelContainer/PanelBackground/GridContainer/LabelCoin
@onready var score_label_star: Label = $PanelContainer/PanelBackground/GridContainer/LabelStar

func refresh_ui(score_coins,score_stars):
	score_label_coin.text = str(score_coins)
	score_label_star.text = str(score_stars)
