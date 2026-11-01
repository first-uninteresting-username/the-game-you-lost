extends "res://players/player_base.gd"

@export var id: int = 0

var home: Vector2


func _ready() -> void:
	player_id = id
	home = position


func reset() -> void:
	position = home
