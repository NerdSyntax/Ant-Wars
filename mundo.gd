extends Node2D

# Referencias a nodos del HUD
@onready var label_comida = get_node_or_null("CanvasLayer/HUD/Panel/Label")
@onready var boton_hormiga = get_node_or_null("CanvasLayer/HUD/Panel/Button")

# Referencias a bases
@onready var base_jugador = get_node_or_null("BaseJugador")
@onready var base_enemiga = get_node_or_null("BaseEnemiga")

func _ready():
	# Conecta el botón al método de invocar hormiga
	if boton_hormiga and base_jugador:
		boton_hormiga.pressed.connect(_on_boton_hormiga_pressed)
	else:
		print("Botón o BaseJugador no encontrado")

func _process(delta):
	# Actualiza Label de comida
	if label_comida:
		label_comida.text = str(int(Global.comida_actual))

func _on_boton_hormiga_pressed():
	if base_jugador:
		base_jugador.invocar_hormiga()
