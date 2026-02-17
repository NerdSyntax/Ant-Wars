extends Node

@export var comida_inicial: int = 100
@export var comida_por_segundo: float = 1.0
@export var costo_hormiga: int = 10

var comida_actual: float

func _ready():
	comida_actual = comida_inicial

func _process(delta):
	comida_actual += comida_por_segundo * delta
