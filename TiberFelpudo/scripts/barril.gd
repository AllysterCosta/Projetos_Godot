extends Node2D



func _ready():
	pass

func dest(sent):
	if sent == -1:
		get_node("anim").play("direita")
	else:
		get_node("anim").play("eskerda")