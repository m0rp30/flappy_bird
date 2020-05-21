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
	if event is InputEventScreenTouch:
		if event.is_pressed():
			velocity.y = -jump


# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		$sfx_flap.play()
		velocity.y = -jump
	
	velocity.y += gravity
	velocity = move_and_slide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	Globals.pipes_count = 0
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func dead():
	position = Vector2(160, 90)
	$AnimatedSprite.play("splat")
	Globals.pipes_speed = Globals.def_pipes_speed
	Globals.pipes_waith_time = Globals.def_pipes_waith_time
	get_tree().paused = true
	$Timer.start()


func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().paused = false
	get_tree().reload_current_scene()


func get_score():
	$sfx_score.play()
