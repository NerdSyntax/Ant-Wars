extends StaticBody2D

@export var escena_enemigo: PackedScene

func _on_timer_timeout():
	if escena_enemigo == null:
		print("No hay escena enemigo asignada")
		return
	
	print("Spawn enemigo")

	var nuevo = escena_enemigo.instantiate()
	get_parent().add_child(nuevo)

	# aparece al lado de la base
	nuevo.global_position = global_position + Vector2(-120, 0)
