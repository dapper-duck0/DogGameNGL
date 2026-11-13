extends Sprite2D
var room1 = preload("res://Background/Cozy Uncanny Nighttime Living Room.png")
var room2 = preload("res://Background/Sunset Pixel-Art Living Room.png")
var room3 = preload("res://Background/Sunlit Retro Living Room.png")
@export var roomNumber: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roomNumber == 1:
		texture = room3
	elif roomNumber == 2:
		texture = room2
	else:
		texture = room1
	pass
