extends StaticBody2D

var home: Vector2
func _ready() -> void:
	home = position
func reset() -> void:
	position = home
