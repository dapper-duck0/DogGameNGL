extends Sprite2D

var room1 = preload("res://Assets/DogBowls/empty_dog_bowl_transparent.png")
var room2 = preload("res://Assets/DogBowls/full_dog_bowl_transparent.png")
var room3 = preload("res://Assets/DogBowls/Pixel-Art Pet Bowl with Severed Hand.png")

var fullAmount: int
var fillingAmount: int

var win = false

@export var roomNumber: int
@export var transitionScenes: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if roomNumber == 1:
		fillingAmount = 15
	elif roomNumber == 2:
		fillingAmount = 10
	else:
		fillingAmount = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fullAmount >= 100 and not win:
		if roomNumber == 3:
			texture = room3
		else:
			texture = room2
		win = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(transitionScenes)
		
		
			
