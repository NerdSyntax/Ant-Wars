extends Node2D

@export var escena_enemigo: PackedScene
@export var tiempo_spawn: float = 3.0

var tiempo_actual: float = 0.0

func _process(delta):
	if not escena_enemigo:
		return

	tiempo_actual += delta
	if tiempo_actual >= tiempo_spawn:
		var nuevo = escena_enemigo.instantiate()
		get_parent().add_child(nuevo)
		# Spawn con offset aleatorio para no acumular enemigos
		var offset = Vector2(randf() * 40 - 20, randf() * 20 - 10)
		nuevo.global_position = global_position + Vector2(-50, 0) + offset
		tiempo_actual = 0.0
