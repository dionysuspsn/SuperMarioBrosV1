extends Enemy

func die():
	super.die()
	set_collision_layer_value(3, false)
	set_collision_mask_value(1, false)
	get_tree().create_timer(0.5).timeout.connect(queue_free)

func _on_timer_timeout():
	horizontal_speed *= -1
	animated_sprite_2d.flip_h = not animated_sprite_2d.flip_h
