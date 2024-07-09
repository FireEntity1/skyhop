extends Label

var index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	match index:
		0 : self.text = "You've made it farther than most"
		1 : self.text = "But you've gone... too far..."
		2 : self.text = "It's time for you to stop"
		3 : self.text = "Count your hours . . ."
		4 : get_tree().change_scene_to_file("res://Scenes/Final.tscn")
	$Timer.start(5)
	index += 1
