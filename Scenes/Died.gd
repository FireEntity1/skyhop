extends Node2D

var index = 0

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
		0 : $Speach.text = "I've got you now"
		1 : $Speach.text = "Be faster next time"
		2 : $Speach.text = " "; $Orb.modulate.a = 0
		3 : get_tree().change_scene_to_file("res://Scenes/FinalFight.tscn")
