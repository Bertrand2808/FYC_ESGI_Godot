extends Node

@onready var game_manager: Node = %GameManager
@onready var score_label: Label = $PanelContainer/PanelBackground/MarginContainer/GridContainer/LabelCoin

func refresh_ui(score):
	score_label.text = str(score)
