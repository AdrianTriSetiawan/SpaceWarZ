extends Label

var score : int = 0

func _ready():
	text = "Score: " + str(score)

func add_score(amount: int):
	score += amount
	update_score_label()

func update_score_label():
	text = "Score: " + str(score)
