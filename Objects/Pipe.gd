extends KinematicBody2D

var difficulty = 1
var active = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y += (randi() % 3 - 1) * 50

func _process(delta: float) -> void:
	
	if active:
		move_and_collide(Vector2(-difficulty-1,0))
		if position.x < -64:
			queue_free()
