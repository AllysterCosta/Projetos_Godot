extends Node2D

func _on_Home_pressed():
	get_node("Anim").play("Hide")
	yield(get_node("Anim"), "finished")
	
	Transition.fade_to("res://Scenes/MainScreen.tscn")
	Transition.clear_above()


func _on_Replay_pressed():
	get_node("Anim").play("Hide")
	yield(get_node("Anim"), "finished")
	
	Transition.fade_to("res://Scenes/Level.tscn")
	Transition.clear_above()