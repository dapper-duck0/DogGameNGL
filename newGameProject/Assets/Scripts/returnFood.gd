extends Area2D

@export var food: Node2D
@export var bowl: Node2D
@export var buttons: Node
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body) -> void:
	var rid = food.get_rid()
	PhysicsServer2D.body_set_state(rid, PhysicsServer2D.BODY_STATE_TRANSFORM, Transform2D(0.0, Vector2(-550.0, 75.0)))
	PhysicsServer2D.body_set_state(rid, PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY, Vector2.ZERO)
func _on_body_exited(body) -> void:
	if not buttons.isHeld:
		SoundManager.play("res://Assets/SoundEffects/universfield-game-bonus-144751.mp3")
		bowl.fullAmount += bowl.fillingAmount
