extends WorldEnvironment

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_antagonist_speak_change():
	index += 1
	match index:
		1 : $DirectionalLight3D.set_color("FF0000"); $DirectionalLight3D.light_angular_distance = 50
		2 : $DirectionalLight3D.set_color("000000")
