extends Area2D

export (int) var speed = 2

func _process(delta):
	position.y += speed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
