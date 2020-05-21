extends Node2D

onready var timer_pipes = $Timer_pipes
onready var timer_game = $Timer_game

var pipes = preload("res://scenes/Pipes.tscn")
var rng = RandomNumberGenerator.new()
var count = 0


func _ready():
	rng.randomize()
	timer_pipes.wait_time = Globals.pipes_waith_time


func _input(event):
	if event.is_pressed():
		if count == 0:
			count = 1
			timer_pipes.start()
			timer_game.start()


func pipes_create():
	var new_pipes = pipes.instance()
	new_pipes.position = $Position2D.global_position
	new_pipes.position.y += rng.randi_range(-45, 45)
	get_node(".").add_child(new_pipes)


func _on_Timer_pipes_timeout():
	pipes_create()


func _on_Timer_game_timeout():
	if Globals.pipes_speed <= 120:
		Globals.pipes_speed += 5
		if Globals.pipes_waith_time >= 2:
			Globals.pipes_waith_time -= .5
			timer_pipes.wait_time = Globals.pipes_waith_time
