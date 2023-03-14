extends Node

onready var pers = get_node("personagem")
onready var camera = get_node("dead_cam")

var moedas = 0
var vidas = 3

func _ready():
	set_process(true)

func _process(delta):
	get_node("canvasLayer/Panel/time").set_text(str(int(get_node("game_time").get_time_left())))

func change_camera():
	camera.set_global_pos(pers.get_node("Camera").get_camera_pos())
	camera.make_current()


func _on_personagem_morreu():
	change_camera()
	get_node("spawn_time").set_wait_time(2)
	get_node("spawn_time").start()
	
	vidas -= 1
	if vidas == 2:
		get_node("canvasLayer/Panel/heart1").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas == 1:
		get_node("canvasLayer/Panel/heart2").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas == 0:
		get_node("canvasLayer/Panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))

func _on_spawn_time_timeout():
	if vidas > 0:
		reviver()
	else:
		transition.fade_to("res://scenes/MainMenu.tscn")
	
func reviver():
	pers.set_pos(get_node("spawn_point").get_pos())
	pers.reviver()
	get_node("game_time").set_wait_time(30)
	get_node("game_time").start()


func _on_personagem_fim():
	change_camera()
	get_node("spawn_time").set_wait_time(3)
	get_node("spawn_time").start()

func _on_personagem_moeda():
	moedas += 1
	get_node("canvasLayer/Panel/moedas").set_text(str(moedas))
	

