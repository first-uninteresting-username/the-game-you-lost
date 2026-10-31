extends CharacterBody2D


@export var player_id: int = 0
@export var speed: float = 300.0


func _physics_process(_delta) -> void:
	var prefix = "p%d_" % player_id
	var y: float = 0
	if player_id != 0:
		y = Input.get_axis(prefix + "up", prefix + "down")
	velocity = Vector2(0, y * speed)
	move_and_slide()

func _draw() -> void:
	var shape = $PlayerShape.shape
	if shape is RectangleShape2D:
		draw_rect(Rect2($PlayerShape.position - shape.size / 2, shape.size), Color(1, 1, 1, 1))
	else:
		# This is a sign something went wrong
		draw_circle($PlayerShape.position, 400, Color(1, 0, 0, 1))
