extends Control

# Nodos del HUD
@onready var boton_hormiga = $Panel/Button
@onready var label_comida = $Panel/Label
@onready var label_cooldown = $Panel/LabelCooldown

# Referencia al jugador
@onready var base_jugador = get_node_or_null("/root/Mundo/base_jugador")  # ruta relativa al CanvasLayer

func _ready():
	if boton_hormiga and base_jugador:
		boton_hormiga.pressed.connect(base_jugador.invocar_hormiga)
	else:
		print("Botón o BaseJugador no encontrado")

func _process(_delta):
	# Actualiza comida
	if label_comida:
		label_comida.text = str(int(Global.comida_actual))
	
	# Actualiza cooldown
	if label_cooldown and base_jugador:
		var t = base_jugador.timer_cooldown
		label_cooldown.text = "Cooldown: %.1f s" % t
