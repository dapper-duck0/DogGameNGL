extends Button

var is_held = false
var is_in_bounds = false
var won = false
var shake_tween: Tween
var petAmount = 0
var is_moving_enough: bool
var work_timer: float = 3.0
var anchor_position: Vector2

@export var sprite: Sprite2D
@export var tilt: float
@export var speed: float
@export var movement_threshold: float = 10.0
@export var petSpeed: float
@export var required_distance: float = 10.0 # Pixels




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
		print(petAmount)
		wiggle()
		
		if petAmount >= 100:
			won = true
			print("You Win")
	

func has_moved_enough() -> bool:
	var current_pos: Vector2 = get_viewport().get_mouse_position()
	return current_pos.distance_to(anchor_position) >= required_distance

func _on_button_down() -> void:
	is_held = true

func _on_button_up() -> void:
	is_held = false
	
func _on_enter() -> void:
	is_in_bounds = true

func _on_exit() -> void:
	is_in_bounds = false

func _unhandled_input(event: InputEvent) -> void:
	is_moving_enough = event is InputEventMouseMotion and event.relative.length() >= movement_threshold

func wiggle() -> void:
	if not shake_tween or not shake_tween.is_running():
		shake_tween = create_tween()
		shake_tween.tween_property(sprite, "rotation_degrees", randf_range(-tilt, tilt), speed)
	
	
