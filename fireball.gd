extends Area2D

class_name Fireball

var direction: int = 1
var speed: float = 300.0

func _ready():
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)
	# Remove a bola de fogo após 3 segundos se não atingir nada
	get_tree().create_timer(3.0).timeout.connect(queue_free)

func _process(delta):
	position.x += speed * direction * delta

func _on_area_entered(area):
	if area is Enemy:
		area.die_from_hit()
		queue_free()

func _on_body_entered(_body):
	queue_free()
