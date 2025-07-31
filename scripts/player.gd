extends Sprite2D

@export var speed: float = 600.0

func _process(delta):
	var move = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move.x += 1
	if Input.is_action_pressed("ui_left"):
		move.x -= 1
	if Input.is_action_pressed("ui_down"):
		move.y += 1
	if Input.is_action_pressed("ui_up"):
		move.y -= 1

	if move != Vector2.ZERO:
		move = move.normalized() * speed * delta
		position += move

	# Clamp position to screen
	position.x = clamp(position.x, 0, 1920)
	position.y = clamp(position.y, 0, 1080)
