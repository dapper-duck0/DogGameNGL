extends Button

@export var currentDay: int
var dayOne = "res://Scenes/Menu.tscn"
var dayTwo = "res://Scenes/StageTwo/Menu2.tscn"
var dayThree = "res://Scenes/StageThree/Menu3.tscn"

func _ready() -> void:
	SoundManager.play("res://MusicFLD/AdventureMusic.wav")
	button_down.connect(_on_button_down)

func _on_button_down() -> void:
	if currentDay == 1:
		get_tree().change_scene_to_file(dayOne)
	elif currentDay == 2:
		get_tree().change_scene_to_file(dayTwo)
	else:
		get_tree().change_scene_to_file(dayThree)
