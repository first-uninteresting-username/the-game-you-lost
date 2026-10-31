extends "res://player_base.gd"

@export var y_acceleration: float = 50.0
@export var y_top_speed: float = 2000.0

var scored: bool = false

func _ready() -> void:
	player_id = 0
	position = Vector2(576, 324)
	scored = false

var initial_x: float = [-1.0, 1.0].pick_random()

func _physics_process(delta) -> void:
	var prefix = "p%d_" % player_id
	var x: float = 1.0 if player_id == 1 else (-1.0 if player_id == 2 else initial_x) 
	velocity.x = x * speed * x_velocity_modifier(velocity.y)
	
	var y: float = 0
	if player_id != 0:
		y = Input.get_axis(prefix + "up", prefix + "down")
	var target_speed: float = (y * y_acceleration) + velocity.y
	velocity.y = move_toward(
		velocity.y, 
		target_speed,
		(y_accelerate_modifier(velocity.y) * y_acceleration * delta)
		)
	var vel := velocity
	move_and_slide()
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var thing = collision.get_collider()
		var normal := get_slide_collision(i).get_normal()
		if vel.dot(normal) < 0.0:
			if thing.is_in_group("walls"):
				var direction: int = -1 if vel.y >= 0 else 1
				velocity.y =  direction * min(
					abs(direction * y_top_speed),
					abs(vel.y * -1.25))
			elif thing.is_in_group("score_walls") && scored == false:
				emit_score()
				scored = true
			elif thing.is_in_group("paddles"):
				velocity.y = vel.y * 0.75
				player_id = thing.id
	

func y_accelerate_modifier(value: float) -> float:
	value = abs(value)
	var n = min(value / y_top_speed, 1.0)
	return 2.0 - pow(n, 2.0)

func x_velocity_modifier(value: float) -> float:
	value = abs(value)
	return max(value / 500, 1.0)

func emit_score() -> void:
	var side: int = 2 if (player_id == 1) else 1
	GameState.add_one_to_score(side)
