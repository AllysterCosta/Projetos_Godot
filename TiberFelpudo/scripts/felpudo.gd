extends Node2D

onready var Idle = get_node("Idle")
onready var Bate = get_node("Bate")
onready var Anim = get_node("Anim")
onready var Grave = get_node("Grave")

var lado
const esk = -1
const dir = 1

func _ready():
	pass
	
func esk():
	set_pos(Vector2(220, 1070))
	Idle.set_flip_h(false)
	Bate.set_flip_h(false)
	
	Grave.set_pos(Vector2(-44, 41))
	Grave.set_flip_h(true)
	lado = esk
	
func dir():
	set_pos(Vector2(500, 1070))
	Idle.set_flip_h(true)
	Bate.set_flip_h(true)
	
	Grave.set_pos(Vector2(28, 41))
	Grave.set_flip_h(false)
	lado = dir
	
	
func bater():
	Anim.play("Bater")
	
func morrer():
	Anim.stop()
	Idle.hide()
	Bate.hide()
	Grave.show()