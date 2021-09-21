extends Node2D

enum GameState { INPUT, WAIT, GAME_OVER }
var _timePressed = 0
var _projectile : RigidBody2D
var _angle := 0.0
var _state = GameState.INPUT


export var _projectiles_remaining := 5
export var degrees_per_second := 20.0


func _ready():
	_spawn_Projectile()
	

func _spawn_Projectile()->void:
	assert(_projectiles_remaining > 0, 'Only call this if there are balls remaining')
	_projectile = preload("res://src/Projectile.tscn").instance()
	_projectile.position = $Spawnpoint.position
	_projectile.add_to_group("Player")
	var _ignored := _projectile.connect("screen_exited", self, "_on_Projectile_screen_exited")
	add_child(_projectile)
	
	_angle = 0
	_projectiles_remaining -= 1
	_update_projectiles_remaining_label()
	
	_state = GameState.INPUT


func _update_projectiles_remaining_label():
	$ProjectilesLeftDisplay.text = "Projectiles Remaining: %d" % _projectiles_remaining
	

func _process(delta):
	if _state == GameState.INPUT:
		$PowerDisplay.text = 'Power: %.2f' % (_timePressed / 10)
		if Input.is_action_pressed("launch"):
			_timePressed += delta * 150
			$PowerDisplay.text = 'Power: %.2f' % (_timePressed / 10)
		if Input.is_action_just_released("launch"):
			var impulse = Vector2.RIGHT.rotated(deg2rad(_angle)) * _timePressed
			_projectile.apply_impulse(Vector2.ZERO, impulse)
			_timePressed = 0
			#$PowerDisplay.text = 'Power: 0'
			$LaunchSound.play()
			var _ignored := _projectile.connect("sleeping_state_changed", self, "_on_Projectile_sleep_state_changed")
			_state = GameState.WAIT
			
		var angle_change := _process_angle_change_input(delta)
		_angle = clamp(_angle + angle_change, -90, 0)
		$AngleDisplay.text = 'Angle: %.2f' % -_angle
		



func _process_angle_change_input(delta) -> float:
	if Input.is_action_pressed("increase_angle"):
		return -degrees_per_second * delta
	if Input.is_action_pressed("decrease_angle"):
		return degrees_per_second * delta
	return 0.0


func _on_Projectile_screen_exited()->void:
	_handle_end_of_shot()


func _on_Projectile_sleep_state_changed()->void:
	if _projectile.sleeping:
		_handle_end_of_shot()


func _handle_end_of_shot() ->void:
	_projectile.disconnect("sleeping_state_changed", self, "_on_Projectile_sleep_state_changed")
	_projectile.disconnect("screen_exited", self, "_on_Projectile_screen_exited")
	_projectile.queue_free()
	if _projectiles_remaining > 0:
		call_deferred("_spawn_Projectile")
	else:
		$ResultsDisplay.set_text("GAME OVER!")
		_state = GameState.GAME_OVER
		$ReturnToTitle.visible = true;
		

func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		$ResultsDisplay.set_text("YOU WIN!")
		$ReturnToTitle.visible = true;


func _on_ReturnToTitle_pressed():
	var _ignored := get_tree().change_scene("res://src/Title_Screen.tscn")
