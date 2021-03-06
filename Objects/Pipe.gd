extends KinematicBody2D

var difficulty = 1
var active = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if active:
		move_and_collide(Vector2(-difficulty-1,0))
