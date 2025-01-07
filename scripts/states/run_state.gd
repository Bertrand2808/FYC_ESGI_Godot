extends PlayerState

func enter(player: Player):
	player.animated_sprite_2d.play("run")

func update_state(player: Player, delta: float):
	if Input.is_action_just_pressed("jump") and player.is_on_floor():  # Vérifie l'appui sur le bouton de saut
		player.state_machine.change_state("JumpState", player)
	elif player.velocity.x == 0:
		player.state_machine.change_state("IdleState", player)
