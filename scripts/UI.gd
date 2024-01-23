extends CanvasLayer

var coins = 0

func _ready(): 
	$Label2.text = str(coins)
	
func on_coin_collected():
	print("Coin +1")
	coins += 1
	$Label2.text = str(coins)
	
	if coins == 3:
		get_tree().change_scene("res://nodes/mundo.tscn")
