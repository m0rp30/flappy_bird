extends CanvasLayer

onready var count_coin = $HBoxContainerLeft/HBoxContainer2/HBoxCoin/Lbl_count_pipes
onready var speed = $HBoxContainerLeft/HBoxContainer2/HBoxCoin/Lbl_pipe_speed
onready var timer = $HBoxContainerLeft/HBoxContainer2/HBoxCoin/Lbl_pipe_timer


func _ready():
	pass


# warning-ignore:unused_argument
func _process(delta):
	count_coin.text = str(Globals.pipes_count)
	speed.text = str(Globals.pipes_speed)
	timer.text = str(Globals.pipes_waith_time)


func _on_TextureButton_pressed():
	get_tree().quit()
