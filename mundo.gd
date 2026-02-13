extends Node2D

@export var escena_hormiga: PackedScene

@onready var label_comida = $CanvasLayer/Label

func _process(delta):
	# generar comida automáticamente
	Global.comida += Global.comida_por_segundo * delta
	
	# mostrar comida en pantalla
	label_comida.text = "Comida: " + str(int(Global.comida))

func _crear_hormiga():
	if escena_hormiga == null:
		print("No hay escena hormiga asignada")
		return

	if Global.comida >= Global.costo_hormiga:
		Global.comida -= Global.costo_hormiga
		
		var nueva = escena_hormiga.instantiate()
		add_child(nueva)
		nueva.global_position = Vector2(200, 400)





func _on_button_pressed() -> void:
	_crear_hormiga()
