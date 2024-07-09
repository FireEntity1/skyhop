extends Label

var index = 0
signal Change

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	match index:
		0 : self.text = "You shouldn't have come here. . ."
		1 : self.text = "I've had enough of this"
		2 : self.text = "Leave now or face the consequence"
		3 : self.text = "No? Don't want to leave?"
		4 : self.text = "Okay then, suit yourself"; emit_signal("Change")
		5 : self.text = " "; emit_signal("Change")
		6 : get_tree().change_scene_to_file("res://Scenes/FinalFight.tscn")
	$Timer.start(5)
	index += 1
