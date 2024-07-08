extends CharacterBody3D


var speed = 15
const JUMP_VELOCITY = 10
@export var sensitivity = -0.1
var capture = true
var jumps = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps == 1:
		velocity.y = JUMP_VELOCITY
		jumps = 0


	var input_dir = Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	if Input.is_action_just_pressed("ground_slam") and not is_on_floor():
		gravity += 500
	elif is_on_floor():
		gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
		jumps = 1
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		capture = false
	move_and_slide()

	if self.position.y < -30:
		self.position.y = 5
		self.position.x = 0
		self.position.z = 0

func _input(event):
	if event is InputEventMouseMotion and capture == true:
		rotate_y(deg_to_rad(event.relative.x * sensitivity))
		$head.rotate_x(deg_to_rad(event.relative.y * sensitivity))
		$head.rotation.x = clamp($head.rotation.x, deg_to_rad(-89), deg_to_rad(89))


func _on_end_point_body_entered(body):
	if body is CharacterBody3D:
		print("END")
		match get_tree().current_scene.name:
			"Tutorial" : get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
			"Level1" : get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
			"Level2" : get_tree().change_scene_to_file("res://Scenes/Level3.tscn")
			"Level3" : get_tree().change_scene_to_file("res://Scenes/Level4.tscn")
			
