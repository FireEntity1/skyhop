extends Label

var index = 0
var index2 = 0
signal run

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	index += 1
	$Timer.start(5)
	match index:
		1 : self.text = "You've  made it clear you don't want to cooperate"
		2 : self.text = "And I won't either"
		3 : self.text = ". . ."
		4 : self.text = "D I E"; emit_signal("run")


func _on_end_point_body_entered(body):
	if body is CharacterBody3D:
		$Timer2.start(2)


func _on_timer_2_timeout():
	index2 += 1
	$Timer2.start(5)
	match index2:
		1 : self.text = "No... this can't be..."
		2 : self.text = "You've won. . ."
		3 : self.text = "I'll let you leave"
		4 : self.text = "Don't come back."
		5 : self.text = "Goodbye"
		6 : self.text = " "
		7 : get_tree().change_scene_to_file("res://Scenes/End.tscn")
