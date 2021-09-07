extends Node2D


func _process(_delta):
	$AngleDisplay.text = "Angle: " + str(-stepify($Projectile.angle,0.01))
	$PowerDisplay.text = "Power: " + str(stepify($Projectile.timePressed,0.01)/10)


func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		$YouWin.set_text("You win!")
	
