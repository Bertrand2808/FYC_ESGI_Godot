extends PlayerState

func enter(player: Player):
	player.animated_sprite_2d.play("jump")
	player.velocity.y = player.JUMP_VELOCITY  # Lance le saut

func update_state(player: Player, delta: float):
	if player.is_on_floor():
		if abs(player.velocity.x) > 0:
			player.state_machine.change_state("RunState", player)
		else:
			player.state_machine.change_state("IdleState", player)
