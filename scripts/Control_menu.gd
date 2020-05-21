extends Control

onready var resume = $ColorRect/CenterContainer/VBoxContainer/TBtn_resume
onready var exit = $ColorRect/CenterContainer/VBoxContainer/TBtn_exit


func _ready():
	resume.grab_focus()


func _physics_process(delta):
	if resume.is_hovered() == true:
		resume.grab_focus()
	if exit.is_hovered() == true:
		exit.grab_focus()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		resume.grab_focus()
		set_paused()


func set_paused():
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_TBtn_resume_pressed():
	set_paused()


func _on_TBtn_exit_pressed():
	get_tree().quit()
