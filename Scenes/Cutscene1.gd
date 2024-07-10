extends Label

var index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	index += 1
	match index:
		0 : self.text = "You've made it farther than most" ; $AudioStreamPlayer2D.play()
		1 : self.text = "A little too far. . ." ; $AudioStreamPlayer2D.play()
		2 : self.text = "It's time for you to stop" ; $AudioStreamPlayer2D.play()
		3 : self.text = " . . . "
		4 : get_tree().change_scene_to_file("res://Scenes/Level5.tscn")
	$Timer.start(5)

