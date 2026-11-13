extends Node

@export var dogSprite: Sprite2D
@export var speed: float = 20
@export var moveLength: float = 1500
@export var transitionScenes: String

var moveDistance = 0
var win = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and not win:
		if event.button_index == MOUSE_BUTTON_LEFT:
			##sound_manager.play_sfx("Walk")
			moveDistance += speed
			dogSprite.position += Vector2(speed, 0)
			if moveDistance > moveLength:
				win = true
				get_tree().change_scene_to_file(transitionScenes)
				
