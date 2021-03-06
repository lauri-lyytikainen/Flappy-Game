extends KinematicBody2D

var speed = 3
var active = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if active:
		move_and_collide(Vector2(-speed,0))
