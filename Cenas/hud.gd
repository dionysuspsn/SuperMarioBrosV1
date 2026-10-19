extends CanvasLayer

@onready var info_label = $InfoLabel as Label
@export var level_time: int = 120

func _ready():
	Manager.hud_updated.connect(update_hud)
	update_hud()
	
	# Criação de um temporizador de 1 segundo para o objetivo de tempo
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.timeout.connect(_on_timer_tick)
	add_child(timer)

func _on_timer_tick():
	if level_time > 0:
		level_time -= 1
		update_hud()
	else:
		# Tempo esgotado: reinicia a fase
		get_tree().reload_current_scene()

func update_hud():
	info_label.text = "PONTOS: %d   VIDAS: %d   TEMPO: %d" % [Manager.score, Manager.lives, level_time]
