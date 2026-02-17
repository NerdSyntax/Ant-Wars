extends CharacterBody2D

@export var velocidad: float = 50.0
@export var vida_max: int = 100
@export var dano: int = 10

var vida_actual: int

func _ready():
	vida_actual = vida_max
	add_to_group("enemigos")
	if has_node("ProgressBar"):
		$ProgressBar.max_value = vida_max
		$ProgressBar.value = vida_actual

	if has_node("Hitbox"):
		$Hitbox.body_entered.connect(_on_hitbox_entered)

func _physics_process(delta):
	velocity = Vector2(-velocidad, 0)  # siempre a la izquierda
	move_and_slide()

func recibir_dano(cantidad):
	vida_actual -= cantidad
	if has_node("ProgressBar"):
		$ProgressBar.value = vida_actual
	if vida_actual <= 0:
		queue_free()

func _on_hitbox_entered(body):
	if body.is_in_group("hormigas"):
		body.recibir_dano(dano)   # la hormiga recibe daño
		recibir_dano(body.dano)   # el enemigo recibe daño
