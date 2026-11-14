extends Node

@export var dogSprite: Sprite2D
@export var speed: float = 20
@export var moveLength: float = 1500
@export var transitionScenes: String
@export var will_whimper: bool = false

var moveDistance = 0
var win = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and not win:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if will_whimper:
				SoundManager.play("res://Assets/SoundEffects/Saddogwhimper.wav")
			else:
				SoundManager.play("res://Assets/SoundEffects/BarkWalkMain.wav")
			moveDistance += speed
			dogSprite.position += Vector2(speed, 0)
			if moveDistance > moveLength:
				SoundManager.remove_all()
				win = true
				get_tree().change_scene_to_file(transitionScenes)
				
