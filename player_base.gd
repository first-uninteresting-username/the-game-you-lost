extends CharacterBody2D


@export var player_id: int = 0
@export var speed: float = 300.0


func _physics_process(_delta):
	var prefix = "p%d_" % player_id
	var y: float = 0
	if player_id != 0:
		y = Input.get_axis(prefix + "up", prefix + "down")
	velocity = Vector2(0, y * speed)
	move_and_slide()
