extends Button
@export var ButtonNum: int
@export var room1: String
@export var room2: String
@export var room3: String
@export var room4: String
@export var room5: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _pressed() -> void:
	if ButtonNum == 1:
		print("Hello1")
		get_tree().change_scene_to_file(room1)
	elif ButtonNum == 2:
		print("Hello2")
		get_tree().change_scene_to_file(room2)
	elif ButtonNum == 3:
		get_tree().change_scene_to_file(room3)
	elif ButtonNum == 4:
		get_tree().change_scene_to_file(room4)
	else:
		get_tree().change_scene_to_file(room5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
