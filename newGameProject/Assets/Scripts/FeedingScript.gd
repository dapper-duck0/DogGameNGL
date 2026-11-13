extends Sprite2D

var room1 = preload("res://Assets/DogBowls/empty_dog_bowl_transparent.png")
var room2 = preload("res://Assets/DogBowls/full_dog_bowl_transparent.png")
var room3 = preload("res://Assets/DogBowls/Pixel-Art Pet Bowl with Severed Hand.png")
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
