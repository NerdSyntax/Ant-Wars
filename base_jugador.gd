extends Node2D

@export var escena_hormiga: PackedScene
@export var max_hormigas: int = 5
@export var cooldown: float = 2.0

var hormigas_spawn: int = 0
var timer_cooldown: float = 0.0

func _process(delta):
	if timer_cooldown > 0:
		timer_cooldown -= delta

func invocar_hormiga():
	if not escena_hormiga:
		print("No hay escena hormiga asignada")
		return
	
	if timer_cooldown > 0:
		print("Cooldown activo")
		return
	
	if hormigas_spawn >= max_hormigas:
		print("Límite de hormigas alcanzado")
		return
	
	if Global.comida_actual >= Global.costo_hormiga:
		Global.comida_actual -= Global.costo_hormiga
		var nueva = escena_hormiga.instantiate()
		get_parent().add_child(nueva)
		# Spawn en posición cercana, evita superposición exacta
		var offset = Vector2(randf() * 40 - 20, randf() * 20 - 10)
		nueva.global_position = global_position + Vector2(50, 0) + offset
		hormigas_spawn += 1
		timer_cooldown = cooldown
	else:
		print("No tienes suficiente comida")
