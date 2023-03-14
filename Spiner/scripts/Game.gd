extends Node

var score1 = 0
var score2 = 0
var spiner1 = false
var spiner2 = false

var resetando

var timer

signal block
signal unblock

func _ready():
	
	pass

func atualiza_score():
	get_node("Control/player1/Score").set_text(str(score1))
	get_node("Control/player2/Score").set_text(str(score2))
	emit_signal("block")
	spiner1 = false
	spiner2 = false


func _on_Spinner1_limit():
	score1 += 1
	get_node("Control/player1/Msg").set_text("Você Ganhou!")
	get_node("Control/player2/Msg").set_text("Você Perdeu!")
	atualiza_score()


func _on_Spinner2_limit():
	score2 += 1
	get_node("Control/player1/Msg").set_text("Você Perdeu!")
	get_node("Control/player2/Msg").set_text("Você Ganhou!")
	atualiza_score()


func _on_Spinner1_zero():
	spiner1 = true
	if spiner2:
		reset()


func _on_Spinner2_zero():
	spiner2 = true
	if spiner1:
		reset()
		
func reset():
	if resetando: return
	resetando = true
	get_node("Control/player1/Msg").set_text("")
	get_node("Control/player2/Msg").set_text("")
	timer = 5
	get_node("EntreRound").start()


func _on_EntreRound_timeout():
	timer -= 1
	if timer > 1:
		get_node("Control/player1/Msg").set_text(str(timer-1))
		get_node("Control/player2/Msg").set_text(str(timer-1))
	if timer == 1:
		get_node("Control/player1/Msg").set_text("GO!")
		get_node("Control/player2/Msg").set_text("GO!")
		resetando = false
		emit_signal("unblock")
	if timer == 0:
		get_node("Control/player1/Msg").set_text("")
		get_node("Control/player2/Msg").set_text("")
