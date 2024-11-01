extends CharacterBody2D

@onready var tail_light = $tail_light
@onready var flood_light = $flood_light

var SPEED = 600.0
const JUMP_VELOCITY = -400.0

#func _process(delta: float) -> void:
	#pass

func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Speed boost when shift is pressed
	if Input.is_action_pressed("shift"):
		SPEED = 800
		flood_light.visible = true  # Turn on flood light
	else:
		SPEED = 600
		flood_light.visible = false  # Turn off flood light
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		# If moving left, activate tail light
		if direction < 0:
			tail_light.visible = true
		else:
			tail_light.visible = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		tail_light.visible = false  # Ensure tail light is off when stationary

	move_and_slide()
