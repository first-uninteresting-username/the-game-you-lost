extends Node

signal score(side: int)

var score_1: int = 0
var score_2: int = 0


func add_one_to_score(side: int) -> void:
	if side == 2:
		score_1 = score_1 + 1
		score.emit(side)
	elif side == 1:
		score_2 = score_2 + 1
		score.emit(side)
	else:
		pass
	get_tree().reload_current_scene()


var pressed_count: float = 0.0


func _process(delta: float) -> void:
	var scene := get_tree().current_scene
	if scene == null:
		pass
	elif scene.scene_file_path == "res://main.tscn" and Input.is_action_pressed("play"):
		pressed_count = pressed_count + delta
		if pressed_count >= 1.0:
			get_tree().change_scene_to_file("res://menu.tscn")
			pressed_count = 0.0

	elif scene.scene_file_path == "res://menu.tscn" and Input.is_action_just_pressed("play"):
		move_to_main()
	else:
		pressed_count = 0.0


func move_to_main() -> void:
	score_1 = 0
	score_2 = 0
	get_tree().change_scene_to_file("res://main.tscn")
