extends KinematicBody2D

onready var score_label : Label = get_node_or_null("Score")
var motion = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position) / 100
	look_at(Player.position)
	
	move_and_collide(motion)

# Di dalam skrip musuh
func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		body.queue_free()
		update_score()
		queue_free()


func update_score():
	if score_label and score_label.is_instance_valid():
		score_label.add_score(10)
		

