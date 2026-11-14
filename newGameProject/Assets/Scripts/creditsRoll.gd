extends Button

func _process(_delta: float) -> void:
	position.y -= 1
	if position.y <= -1300:
		print("Would close")
