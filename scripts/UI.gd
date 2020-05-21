extends CanvasLayer

onready var count_coin = $HBoxContainerLeft/HBoxCoin/Lbl_count_pipes
onready var speed = $HBoxContainerLeft/HBoxCoin/Lbl_pipe_speed
onready var timer = $HBoxContainerLeft/HBoxCoin/Lbl_pipe_timer


func _ready():
	pass


func _process(delta):
	count_coin.text = str(Globals.pipes_count)
	speed.text = str(Globals.pipes_speed)
	timer.text = str(Globals.pipes_waith_time)
