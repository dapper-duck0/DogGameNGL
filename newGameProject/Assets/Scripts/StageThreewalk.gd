extends Node

@export var dogSprite: Sprite2D
@export var speed: float = 20
@export var moveLength: float = 1500
@export var transitionScenes: String
@export var progressBar: ProgressBar

var shake_tween: Tween
var moveDistance = 0
var stage = 1
var win = false
var new_texture = load("res://Assets/DogImanges/DohholdbackOpen (1).png")
var ending_texture = load("res://Assets/DogImanges/TheLook.png")
var the_look = load("res://Assets/DogImanges/DogholdbackClose (1).png")
var blood: Sprite2D

func _ready() -> void:
	SoundManager.play("res://Assets/SoundEffects/alex_jauk-creepy-ghost-man-ambient-theme-435682.mp3")

func _process(delta: float) -> void:
	if stage == 2 and not win:
		moveDistance -= 5 * delta
		progressBar.value = moveDistance
		if moveDistance < -25:
			win = true
			blood = $"../Sprite2D"
			
			SoundManager.play("res://Assets/SoundEffects/Loud Scream.wav")
			SoundManager.play("res://Assets/SoundEffects/freesound_community-monster-scream-death-101123.mp3")
			
			dogSprite.scale *= 2
			dogSprite.texture = ending_texture
			dogSprite.position = Vector2(600,400)
			await get_tree().create_timer(.1).timeout
			blood.visible = true
			await get_tree().create_timer(.6).timeout
			SoundManager.stop_all()
			get_tree().change_scene_to_file("res://Scenes/StageThree/Menu3.tscn")
		wiggle()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and stage == 1:
		if event.button_index == MOUSE_BUTTON_LEFT:
			SoundManager.play("res://Assets/SoundEffects/SingleStep.wav")
			moveDistance += speed
			dogSprite.position += Vector2(0, speed)
			dogSprite.scale *= 1.1
			
			if moveDistance > 240:
				SoundManager.stop_all()
				SoundManager.play("res://Assets/SoundEffects/TwoDogs.wav")
				stage = 2
				moveDistance = 0
				speed = 3
				dogSprite.texture = new_texture
				dogSprite.scale = Vector2(2,2)
				dogSprite.position += Vector2(0, -250)
	elif event is InputEventMouseButton and event.pressed and stage == 2:
		if event.button_index == MOUSE_BUTTON_LEFT:
			moveDistance += speed
			progressBar.visible = true
			progressBar.value = moveDistance
			if moveDistance > 100:
				stage = 3
				win = true
				dogSprite.texture = the_look
				SoundManager.stop_all()
				await get_tree().create_timer(1.5).timeout
				
				get_tree().change_scene_to_file("res://Scenes/StageThree/Menu3.tscn")
				
		
func wiggle() -> void:
	if not shake_tween or not shake_tween.is_running():
		shake_tween = create_tween()
		shake_tween.tween_property(dogSprite, "rotation_degrees", randf_range(-15, 15), 0.05)
