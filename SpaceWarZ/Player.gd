extends KinematicBody2D

var movespeed = 500
var bullet_speed = 2000
var bullet = preload ("res://Bullet.tscn")
onready var lasershot = $lasershot
onready var score_label = $score  # Menambahkan label "score" dengan nama "score"

var score = 0  # Inisialisasi variabel skor

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()  # Inisialisasi vektor gerakan

	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1

	motion = motion.normalized()  # Normalisasi vektor gerakan
	motion = move_and_slide(motion * movespeed)

	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	lasershot.play()
	bullet_instance.position = get_global_mouse_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0 ).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)

func kill():
	get_tree().reload_current_scene()
	if $Menu:
		$Menu.update_score_ui(score)  # Memperbarui label skor di menu saat permainan berakhir

func _on_Area2D_body_entered(body):
	if "Enemies" in body.name:
		kill()
		score += 10  # Menambahkan skor saat musuh terkena
		if score_label:
			score_label.text = "Score: " + str(score)  # Memperbarui label skor in-game
