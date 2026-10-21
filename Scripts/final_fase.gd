extends Area2D

@export_file("*.tscn") var proxima_fase: String = "res://Cenas/menu_inicial.tscn"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file(proxima_fase)
