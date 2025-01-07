extends Node
class_name StateMachine

var current_state: PlayerState = null
var states = {}

# Ajoute un état à la machine
func add_state(state_name: String, state: PlayerState):
	states[state_name] = state

# Change l'état actif
func change_state(state_name: String, player: Player):
	if current_state != null:
		current_state.exit(player)
	current_state = states.get(state_name)
	if current_state != null:
		current_state.enter(player)

# Met à jour l'état actif
func update_state(player: Player, delta: float):
	if current_state != null:
		current_state.update_state(player, delta)
