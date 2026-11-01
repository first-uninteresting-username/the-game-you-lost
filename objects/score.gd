extends Label


func _ready() -> void:
	if GameState.score_1 + GameState.score_2 != 0:
		text = "%d : %d" % [GameState.score_1, GameState.score_2]
