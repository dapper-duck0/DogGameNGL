extends Button

var is_held = false
var is_in_bounds = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	mouse_entered.connect(_on_enter)
	mouse_exited.connect(_on_exit)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_held and is_in_bounds:
		print("Petting")

func _on_button_down() -> void:
	is_held = true

func _on_button_up() -> void:
	is_held = false
	
func _on_enter() -> void:
	is_in_bounds = true

func _on_exit() -> void:
	is_in_bounds = false
