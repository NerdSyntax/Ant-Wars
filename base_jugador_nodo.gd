extends Node2D

@export var hormiga_scene: PackedScene

func spawn_hormiga():
	if hormiga_scene == null:
		print("No hay escena hormiga asignada")
		return

	var hormiga = hormiga_scene.instantiate()
	get_parent().add_child(hormiga)

	hormiga.global_position = global_position + Vector2(80, 0)
