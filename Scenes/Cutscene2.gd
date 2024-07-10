extends Label

var index = 0
signal Change
var vol = 11
var isDown = false

func _ready():
	$Timer.start(5)

func _physics_process(delta):
	if isDown == true:
		vol -= 0.05
		$AudioStreamPlayer2D.volume_db = vol

func _on_timer_timeout():
	match index:
		0 : self.text = "You shouldn't have come here. . ."
		1 : self.text = "I've had enough of this"
		2 : self.text = "Leave now or face the consequence"
		3 : self.text = "No? Don't want to leave?"
		4 : self.text = "Okay then, suit yourself"; emit_signal("Change");vol = 16; $AudioStreamPlayer2D.volume_db = vol
		5 : self.text = " "; emit_signal("Change");vol = 17; $AudioStreamPlayer2D.volume_db = vol
		6 : self.text = "W a t c h   o u t ."
		7 : self.text = " "; isDown = true
		8 : get_tree().change_scene_to_file("res://Scenes/FinalFight.tscn")
	$Timer.start(5)
	index += 1
