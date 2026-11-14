extends Sprite2D   # or whatever this node is

@export var shake_distance: float = 10.0
@export var shake_speed: float = 83.0

var last_offset := Vector2.ZERO

func _process(delta: float) -> void:
	position -= last_offset
	last_offset = Vector2(sin(Time.get_ticks_msec() / 1000.0 * shake_speed) * shake_distance, 0.0)
	position += last_offset
