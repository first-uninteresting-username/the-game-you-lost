extends "res://player_base.gd"

@export var id: int = 0

func _physics_process(_delta) -> void:
	var prefix = "p%d_" % id
	var multiplier: float = 1.0 if player_id == id else 0.25
	var y: float = Input.get_axis(prefix + "up", prefix + "down")
	velocity = Vector2(0, y * speed * multiplier)
	move_and_slide()

func _ready() -> void:
	player_id = id
