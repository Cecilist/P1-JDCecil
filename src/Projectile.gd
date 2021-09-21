extends RigidBody2D

signal screen_exited

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("screen_exited")
