extends Button
@export var ButtonNum: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _pressed() -> void:
	if ButtonNum == 1:
		print("Hello1")
		get_tree().change_scene_to_file("res://Scenes/Ricardotest.tscn")
	elif ButtonNum == 2:
		print("Hello2")
		get_tree().change_scene_to_file("res://Scenes/FeedTheStorm.tscn")
	elif ButtonNum == 3:
		get_tree().change_scene_to_file("res://Scenes/RicardoWalk.tscn")
	elif ButtonNum == 4:
		print("Hello4")
	else:
		print("Hello5")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
