extends Area2D

@export var Buttons: Array[Button]
@export var fade_time: float = 0.3

var tween: Tween

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	# start hidden
	for b in Buttons:
		b.modulate.a = 0.0
		b.disabled = true

func _on_body_entered(body) -> void:
	fade_buttons(1.0)

func _on_body_exited(body) -> void:
	fade_buttons(0.0)

func fade_buttons(target_alpha: float) -> void:
	if tween:
		tween.kill()   # stop a fade that's still running
	tween = create_tween().set_parallel(true)
	for b in Buttons:
		tween.tween_property(b, "modulate:a", target_alpha, fade_time)
		b.disabled = (target_alpha == 0.0)
