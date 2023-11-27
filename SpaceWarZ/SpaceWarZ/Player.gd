extends KinematicBody2D

var movespeed = 500
var bullet_speed = 2000
var bullet = preload("res://Bullet.tscn")
onready var lasershot = $lasershot
var score = 0
var score_label
var bullet_instance: Node2D = null

func _ready():
	pass

# warning-ignore:unused_argument
func _physics_process(delta):
	var motion = Vector2()

	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1

	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)

	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	bullet_instance = bullet.instance()
	lasershot.play()
	bullet_instance.position = get_global_mouse_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.linear_velocity = Vector2(bullet_speed, 0).rotated(rotation)
	get_tree().get_root().call_deferred("add_child", bullet_instance)

func kill():
	if bullet_instance:
		bullet_instance.queue_free()  # Hapus peluru jika ada yang aktif
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
 # Memperbarui label skor di menu saat permainan berakhir

func _on_Area2D_body_entered(body):
	if "Enemies" in body.name:
		kill()

func _on_score_tree_entered():
	pass
