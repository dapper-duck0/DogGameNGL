extends Button

@export var isHeld = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_down.connect(_heldChangeTrue)
	button_up.connect(_heldChangeFalse)

func _heldChangeTrue() -> void:
	SoundManager.play("res://Assets/SoundEffects/litupsubway-paper-grab-2-616937.mp3")
	isHeld = true
func _heldChangeFalse() -> void:
	isHeld = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
