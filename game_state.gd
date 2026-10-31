extends Node


signal score(side: int)

var score_1: int = 0
var score_2: int = 0

func add_one_to_score(side: int) -> void:
	if side == 1:
		score_1 = score_1 + 1
	elif side == 2:
		score_2 = score_2 + 1
	score.emit(side)
	print("%d scored" % side)
