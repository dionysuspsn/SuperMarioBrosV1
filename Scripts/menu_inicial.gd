extends Control

@export_file("*.tscn") var primeira_fase: String = "res://Cenas/fase_espaco.tscn"

@onready var botao_jogar = $VBoxContainer/BotaoJogar as Button

func _ready():
	botao_jogar.pressed.connect(_on_botao_jogar_pressed)

func _on_botao_jogar_pressed():
	Manager.reset_stats()
	get_tree().change_scene_to_file(primeira_fase)
