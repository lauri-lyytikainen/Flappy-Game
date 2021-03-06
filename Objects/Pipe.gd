extends KinematicBody2D

var difficulty = 1
var active = true
onready var upper_pipe = get_node("Upper Pipe")
onready var lower_pipe = get_node("Lower Pipe")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = (randf()-0.5)
	position.y += (r) * 200
	var g = randf()*20
	upper_pipe.position.y = -195-int(g)
	lower_pipe.position.y = 195+int(g)

func _process(delta: float) -> void:
	
	if active:
		move_and_collide(Vector2(-difficulty-1,0))
		if position.x < -64:
			queue_free()
