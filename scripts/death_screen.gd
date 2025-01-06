extends Control

@onready var deathSound : AudioStreamPlayer2D = $DeathSound  # or $Audio/DeathSound if nested

func _ready() -> void:
	if deathSound:
		deathSound.playing = true
