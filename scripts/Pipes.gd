extends Node2D

var speed = Globals.pipes_speed


func _ready():
	pass


func _physics_process(delta):
	position.x += -speed * delta


func _on_Pipe_up_body_entered(body):
	check_body(body)


func _on_Pipe_down_body_entered(body):
	check_body(body)


func check_body(var body):
	if body.is_in_group("Player"):
		Globals.pipes_speed = 0
		body.dead()
		#get_tree().reload_current_scene()


func _on_VisibilityNotifier2D_screen_exited():
	get_node(".").queue_free()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		Globals.pipes_count += 1
