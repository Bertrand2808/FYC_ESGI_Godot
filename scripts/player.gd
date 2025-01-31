extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var tilemap: TileMap = $"../TileMap"  # Ensure this points to the TileMap, not the layer

# Define the coordinates of the last platform area
var last_platform_area = Rect2(Vector2(121, 4), Vector2(6, 1))  # (Width = 6, Height = 1)

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction: -1, 0, or 1
	var direction := Input.get_axis("move_left", "move_right")

	# Flip sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")

	# Set horizontal velocity
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the character
	move_and_slide()

	# Check if player reaches the last platform
	_check_last_platform()

func _check_last_platform() -> void:
	# Convert world position of the player to TileMap coordinates (correct approach for Godot 4)
	var player_tile_pos = tilemap.local_to_map(global_position)
	if last_platform_area.has_point(player_tile_pos):
		_navigate_to_end_screen()

func _navigate_to_end_screen() -> void:
	get_tree().change_scene_to_file("res://scenes//end_screen.tscn")
