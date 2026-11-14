extends Node

@export var dogSprite: Sprite2D
@export var speed: float = 20
@export var moveLength: float = 1500
@export var transitionScenes: String

var shake_tween: Tween
var moveDistance = 0
var stage = 1
var win = false
var new_texture = load("res://Assets/DogImanges/DohholdbackOpen (1).png")



func _process(delta: float) -> void:
	if stage == 2:
		wiggle()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and stage == 1:
		if event.button_index == MOUSE_BUTTON_LEFT:
			SoundManager.play("res://Assets/SoundEffects/BarkWalkMain.wav")
			moveDistance += speed
			dogSprite.position += Vector2(0, speed)
			dogSprite.scale *= 1.1
			if moveDistance > 240:
				stage = 2
				dogSprite.scale = Vector2(2,2)
				dogSprite.position += Vector2(0, -250)
	elif stage == 2:
		dogSprite.texture = new_texture
		
		
func wiggle() -> void:
	if not shake_tween or not shake_tween.is_running():
		shake_tween = create_tween()
		shake_tween.tween_property(dogSprite, "rotation_degrees", randf_range(-15, 15), 0.05)
