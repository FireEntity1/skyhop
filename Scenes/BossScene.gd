extends Label

var index = 0
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
