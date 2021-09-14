extends RigidBody2D

var timePressed = 0
var angle = 0
export var degreesPerSecond = 20

func _process(delta):
	if Input.is_action_pressed("launch"):
		timePressed += delta * 150
		#$ProjectileHUD/PowerDisplay.text = "Power: " + str(stepify(timePressed,0.01))
	if Input.is_action_just_released("launch"):
		var impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * timePressed
		apply_impulse(Vector2.ZERO, impulse)
		$launchSound.play()
		timePressed = 0
	if Input.is_action_pressed("increase_angle"):
		angle -= degreesPerSecond*delta
		angle = clamp(angle, -90, 0)
		#$ProjectileHUD/AngleDisplay.text = "Angle: " + str(stepify(-angle,0.01))
	if Input.is_action_pressed("decrease_angle"):
		angle += degreesPerSecond*delta
		angle = clamp(angle, -90, 0)
		#$ProjectileHUD/AngleDisplay.text = "Angle: " + str(stepify(-angle,0.01))
	


#func _on_VisibilityNotifier2D_viewport_exited(viewport):
	#queue_free()
	#var projectile = load("res://src/Projectile.tscn").instance()
	#add_child(projectile)

