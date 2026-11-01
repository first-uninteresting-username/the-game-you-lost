extends Label


func _ready() -> void:
	GameState.score.connect(_on_score)
	text = "%d : %d" % [GameState.score_1, GameState.score_2]


func _on_score(_side: int) -> void:
	text = "%d : %d" % [GameState.score_1, GameState.score_2]
