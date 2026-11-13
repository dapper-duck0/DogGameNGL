extends RigidBody2D

@export var Buttons: Node

func _process(delta: float) -> void:
	if Buttons.isHeld:
		var rid := get_rid()
		var pos := get_global_mouse_position()
		PhysicsServer2D.body_set_state(rid, PhysicsServer2D.BODY_STATE_TRANSFORM, Transform2D(global_rotation, pos))
		PhysicsServer2D.body_set_state(rid, PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY, Vector2.ZERO)
		PhysicsServer2D.body_set_state(rid, PhysicsServer2D.BODY_STATE_ANGULAR_VELOCITY, 0.0)
