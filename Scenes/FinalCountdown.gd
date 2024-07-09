extends WorldEnvironment

var isRunning
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isRunning == true:
		$Label.text = str($Timer.time_left)
		$DirectionalLight3D.light_angular_distance += 0.02


func _on_antagonist_speak_run():
	$Timer.start(50)
	isRunning = true
