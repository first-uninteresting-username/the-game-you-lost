extends CharacterBody2D

const SPEED = 3000.0
const ACCELERATION = 1500.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta)
	move_and_slide()
