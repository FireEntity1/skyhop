extends WorldEnvironment

var isRunning
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isRunning == true:
		$Label.text = str(roundf($Timer.time_left))
		$DirectionalLight3D.light_angular_distance += 0.02


func _on_antagonist_speak_run():
	$Timer.start(50)
	isRunning = true


func _on_end_point_body_entered(body):
	$DirectionalLight3D.light_angular_distance = 15
	isRunning = false
	$Label.text = " "


func _on_timer_timeout():
	if isRunning == true:
		get_tree().change_scene_to_file("res://Scenes/Died.tscn")
