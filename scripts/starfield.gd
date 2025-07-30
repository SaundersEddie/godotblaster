extends Node2D

@onready var parallax_bg = $ParallaxBackground
@onready var press_fire_label = $CanvasLayer/Label

var blink_timer = 0.0

var layer_speeds = [10, 30, 60] # pixels/sec (Far, Mid, Near)

func _process(delta):
	# Parallax scroll
	for i in range(3):
		var layer = parallax_bg.get_child(i)
		layer.motion_offset.x += layer_speeds[i] * delta

	# Blinking text
	blink_timer += delta
	press_fire_label.visible = (sin(blink_timer * PI) > 0)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"): # Space/Enter/Gamepad-A
		# Next: Replace with your actual level scene path
		get_tree().change_scene_to_file("res://scenes/Level1.tscn")
