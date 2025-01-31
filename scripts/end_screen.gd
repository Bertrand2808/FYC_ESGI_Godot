extends Node

@onready var final_score_label: Label = $BigPanelContainer/BigPanelBackground/MarginContainer/GridContainer/MarginContainer/ScoreLabel

func _ready() -> void:
	final_score_label.text = "Pièces collectées: " + str(Global.get_state("score_coins")) + "\n"
	final_score_label.text += "\nÉtoiles collectées: " + str(Global.get_state("score_stars")) + "\n"
	final_score_label.text += "\nTemps passé: " + "%.2f" % ((Time.get_ticks_msec() - Global.get_state("start_time")) / 1000.0) + "s"
