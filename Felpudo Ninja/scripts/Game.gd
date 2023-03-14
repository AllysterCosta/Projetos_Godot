extends Node2D

onready var frutas = get_node("Frutas")
var tomate = preload("res://scenes/tomate.tscn")
var lemon = preload("res://scenes/lemon.tscn")
var laranja = preload("res://scenes/laranja.tscn")
var pera = preload("res://scenes/pera.tscn")
var bomb = preload("res://scenes/Bomb.tscn")

var score = 0
var lifes = 3

func _ready():
	pass


func _on_gerador_timeout():
	if lifes <= 0: return
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0, 5))
		var obj
		if  type == 0:
			obj = pera.instance()
		elif type == 1:
			obj = laranja.instance()
		elif type == 2:
			obj = lemon.instance()
		elif type == 3:
			obj = tomate.instance()
		elif type == 4:
			obj = bomb.instance() #deve ser alterado ainda
			
		obj.born(Vector2(rand_range(200, 1080), 800))
		obj.connect("life", self, "dec_life")
		if type != 4:
			obj.connect("score", self, "inc_score")
		frutas.add_child(obj)
func dec_life():
	lifes -= 1
	if lifes == 0:
		get_node("GameOverScreen").start()
		get_node("InputProc").acabou = true
		print("acabou jogo")
		get_node("Control/Bomb1").set_modulate(Color(1, 0, 0))
	if lifes == 2:
		get_node("Control/Bomb3").set_modulate(Color(1, 0, 0))
	if lifes == 1:
		get_node("Control/Bomb2").set_modulate(Color(1, 0, 0))

func inc_score():
	if lifes == 0: return
	score += 1
	get_node("Control/Label").set_text(str(score))