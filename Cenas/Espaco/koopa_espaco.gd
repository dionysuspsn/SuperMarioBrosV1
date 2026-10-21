extends Koopa

func _on_timer_timeout():
	# Só patrulha para um lado e outro se ele ainda NÃO for um casco
	if not in_a_shell:
		horizontal_speed *= -1
		animated_sprite_2d.flip_h = not animated_sprite_2d.flip_h

func die():
	if !in_a_shell:
		super.die()
	else:
		# Se já é um casco e recebe dano/morte, para imediatamente
		horizontal_speed = 0
		vertical_speed = 0
		animated_sprite_2d.play("dead")
