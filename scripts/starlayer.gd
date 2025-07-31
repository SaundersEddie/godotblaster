extends Node2D

@export var star_count: int = 20
@export var speed: float = 40.0
@export var color: Color = Color.WHITE
@export var width: int = 1920
@export var height: int = 1080
@export var direction: int = -1 # -1 = left, 1 = right

var stars = []

func _ready():
	randomize()
	for i in range(star_count):
		var star = ColorRect.new()
		star.color = color
		star.size = Vector2(4, 4)
		star.position = Vector2(randi() % width, randi() % height)
		add_child(star)
		stars.append(star)

func _process(delta):
	for star in stars:
		star.position.x += direction * speed * delta
		if direction == -1 and star.position.x < -4:
			star.position.x = width
			star.position.y = randi() % height
		elif direction == 1 and star.position.x > width:
			star.position.x = -4
			star.position.y = randi() % height
