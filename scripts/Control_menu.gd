extends Control

onready var resume = $CenterContainer/VBoxContainer/TBtn_resume
onready var exit = $CenterContainer/VBoxContainer/TBtn_exit


func _ready():
	resume.grab_focus()


# warning-ignore:unused_argument
func _process(delta):
	if resume.is_hovered():
		resume.grab_focus()
	if exit.is_hovered():
		exit.grab_focus()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		print("ui_cancel")
		resume.grab_focus()
		set_paused()


func set_paused():
	get_tree().paused = !get_tree().paused
	visible = !visible


func _on_TBtn_resume_pressed():
	set_paused()


func _on_TBtn_exit_pressed():
	get_tree().quit()
