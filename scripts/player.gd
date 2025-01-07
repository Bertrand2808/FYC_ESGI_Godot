extends CharacterBody2D
class_name Player

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine = StateMachine.new()  # Initialise la machine à états
# Chargement des scripts depuis leur chemin
const StateMachine = preload("res://scripts/states/state_machine.gd")
const IdleState = preload("res://scripts/states/idle_state.gd")
const RunState = preload("res://scripts/states/run_state.gd")
const JumpState = preload("res://scripts/states/jump_state.gd")
# Préparation des états au démarrage
func _ready():
	state_machine.add_state("IdleState", IdleState.new())
	state_machine.add_state("RunState", RunState.new())
	state_machine.add_state("JumpState", JumpState.new())
	state_machine.change_state("IdleState", self)  # Commence en état idle

func _physics_process(delta: float):
	# Gestion de la gravité et du mouvement
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Capture de la direction de déplacement (gauche/droite)
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Met à jour l'état en cours via la machine à états
	state_machine.update_state(self, delta)

	# Applique le mouvement
	move_and_slide()
