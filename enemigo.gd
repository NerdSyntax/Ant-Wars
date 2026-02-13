extends CharacterBody2D

var velocidad = -80
var vida = 100
var daño = 10

func _physics_process(delta):
	velocity.x = velocidad
	move_and_slide()

func recibir_daño(cantidad):
	vida -= cantidad
	if vida <= 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("recibir_daño"):
		body.recibir_daño(daño)
