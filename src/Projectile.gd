extends RigidBody2D

var _angle = 0
export var degreesPerSecond = 20

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2.RIGHT.rotated(deg2rad(_angle)) * 250
		apply_impulse(Vector2.ZERO, impulse)
	if Input.is_action_pressed("increase_angle"):
		_angle -= degreesPerSecond*delta
		_angle = clamp(_angle, -90, 0)
		print(_angle)
	if Input.is_action_pressed("decrease_angle"):
		_angle += degreesPerSecond*delta
		_angle = clamp(_angle, -90, 0)
		print(_angle)

