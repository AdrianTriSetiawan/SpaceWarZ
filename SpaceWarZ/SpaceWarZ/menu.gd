extends Node2D

export var mainGameScene: PackedScene
onready var final_score_label = $FinalScoreLabel
var final_score = 0

func _on_NewGameButton_button_up():
	get_tree().change_scene(mainGameScene.resource_path)

func set_final_score(score):
	final_score = score
	final_score_label.text = "Final Score: " + str(final_score)
