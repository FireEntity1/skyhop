extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 8
@export var sensitivity = -0.1
var capture = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("ground_slam") and not is_on_floor():
		gravity += 500
	elif is_on_floor():
		gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		capture = false
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion and capture == true:
		rotate_y(deg_to_rad(event.relative.x * sensitivity))
		$head.rotate_x(deg_to_rad(event.relative.y * sensitivity))
		$head.rotation.x = clamp($head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

	
