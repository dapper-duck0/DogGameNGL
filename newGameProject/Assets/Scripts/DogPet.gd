extends Button

var is_held = false
var is_in_bounds = false
var won = false
var shake_tween: Tween
var petAmount = 0
var is_moving_enough: bool
var work_timer: float = 3.0
var anchor_position: Vector2
var blood: Sprite2D

@export var sprite: Sprite2D
@export var progressBar: ProgressBar
@export var tilt: float
@export var speed: float
@export var movement_threshold: float = 10.0
@export var petSpeed: float
@export var required_distance: float = 10.0
@export var transitionScenes: String
@export var night: int

var new_texture = load("res://Assets/DogImanges/DohholdbackOpen (1).png")
var firstSound = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if night == 2:
		SoundManager.play("res://Assets/SoundEffects/pantoman-demon-breathing-619441.mp3")
	elif night == 3:
		SoundManager.play("res://MusicFLD/soundreality-horror-mirror-room-249033.mp3")
	else:
		SoundManager.play("res://Assets/SoundEffects/freesound_community-dog_panting_20090425t1417-22476.mp3")
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	mouse_entered.connect(_on_enter)
	mouse_exited.connect(_on_exit)
	anchor_position = get_viewport().get_mouse_position()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if is_held and is_in_bounds and has_moved_enough() and not won:
		anchor_position = get_viewport().get_mouse_position()
		petAmount += petSpeed * delta
		progressBar.value = petAmount
		wiggle()
		if not SoundManager.is_sound_playing("res://Assets/SoundEffects/Petting Dog.wav"):
			SoundManager.play("res://Assets/SoundEffects/Petting Dog.wav")
		if night == 2 and petAmount > 80 and not firstSound:
			firstSound = true
			SoundManager.play("res://Assets/SoundEffects/LoudGrowl.wav")
		
		if petAmount >= 100 and night != 3:
			won = true
			SoundManager.stop_all()
			
			get_tree().change_scene_to_file(transitionScenes)
		elif petAmount >= 100 and night == 3:
			progressBar.position = Vector2(-1000, -1000)
			sprite.position = Vector2(-500,500)
			won = true
			SoundManager.stop_all()
			await get_tree().create_timer(4.3).timeout
			blood = $"../Sprite2D"
			SoundManager.play("res://Assets/SoundEffects/Loud Scream.wav")
			SoundManager.play("res://Assets/SoundEffects/freesound_community-monster-scream-death-101123.mp3")
			
			sprite.scale *= 2
			sprite.texture = new_texture
			sprite.position = Vector2(600,400)
			await get_tree().create_timer(.1).timeout
			blood.visible = true
			await get_tree().create_timer(.5).timeout
			get_tree().change_scene_to_file(transitionScenes)
			
	

func has_moved_enough() -> bool:
	var current_pos: Vector2 = get_viewport().get_mouse_position()
	return current_pos.distance_to(anchor_position) >= required_distance

func _on_button_down() -> void:
	is_held = true

func _on_button_up() -> void:
	SoundManager.remove_one("res://Assets/SoundEffects/Petting Dog.wav")
	is_held = false
	
func _on_enter() -> void:
	is_in_bounds = true

func _on_exit() -> void:
	is_in_bounds = false
	SoundManager.remove_one("res://Assets/SoundEffects/Petting Dog.wav")

func _unhandled_input(event: InputEvent) -> void:
	is_moving_enough = event is InputEventMouseMotion and event.relative.length() >= movement_threshold

func wiggle() -> void:
	if not shake_tween or not shake_tween.is_running():
		if night != 3:
			shake_tween = create_tween()
			shake_tween.tween_property(sprite, "rotation_degrees", randf_range(-tilt, tilt), speed)
	
	
