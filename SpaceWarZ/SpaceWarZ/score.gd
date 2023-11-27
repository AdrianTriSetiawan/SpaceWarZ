extends Label

var score = 0


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		score += 1
		text = "Score: %s" % score
