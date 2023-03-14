extends Node2D

onready var passaro = get_node("Passaro")
onready var timerreplay = get_node("time to replay")
onready var label = get_node("textos/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	
	pass

func kill():
	passaro.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("backanim").stop()
	estado = PERDENDO
	timerreplay.start()
	get_node("SomHit").play()

func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	get_node("SomScore").play()


func _on_time_to_replay_timeout():
	get_tree().reload_current_scene()
