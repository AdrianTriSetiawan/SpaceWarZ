extends Label

onready var score_label = $Score

var score = 0

func _ready():
	text = "Score: " + str(score)

func add_score(amount: int):
	score += amount
	print("Score added:", amount)
	update_score_label()

func update_score_label():
	text = "Score: " + str(score)
	print("Score updated:", score)
