extends Area2D
signal got_hit
signal moved

export (int) var speed = 20

func _process(delta):
	var direction = 0
	if Input.is_action_just_pressed("move_left"):
		emit_signal("moved")
		direction -= 1
	if Input.is_action_just_pressed("move_right"):
		emit_signal("moved")
		direction += 1
	
	position.x += speed * direction
	position.x = clamp(position.x, 50, 250)



func _on_Player_area_entered(area):
	emit_signal("got_hit")
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	show()
	$CollisionShape2D.disabled = false
	position = pos
