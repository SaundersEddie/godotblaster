extends Node2D

@onready var press_fire_label = $CanvasLayer/Label
@export var width: int = 1920
@export var height: int = 1080

var blink_timer = 0.0

func _process(delta):
	blink_timer += delta
	press_fire_label.visible = (sin(blink_timer * PI) > 0)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/Level1.tscn")
