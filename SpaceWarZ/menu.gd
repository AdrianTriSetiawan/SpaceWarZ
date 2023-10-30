extends Node2D

export var mainGameScene : PackedScene
onready var final_score_label = $FinalScoreLabel  # Label skor akhir di menu
var final_score = 0  # Variabel untuk menyimpan skor akhir

func _on_NewGameButton_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
