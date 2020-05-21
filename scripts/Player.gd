extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 60
var jump = 150
var gravity = 0
var first_jump = 0


func _ready():
	pass


func _input(event):
	if event.is_pressed():
		gravity = 10


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -jump
	
	velocity.y += gravity
	velocity = move_and_slide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	Globals.pipes_count = 0
	get_tree().reload_current_scene()
