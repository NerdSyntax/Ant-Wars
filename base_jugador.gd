extends Node2D

@export var hormiga: PackedScene

func invocar_hormiga():
	if hormiga == null:
		return

	var h = hormiga.instantiate()
	get_parent().add_child(h)
	h.global_position = global_position + Vector2(80, 0)
