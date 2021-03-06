extends Node2D

onready var pipe_timer = get_node("pipe_timer")
var pipe = preload("res://Objects/Pipe.tscn")
var pipes = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()


func _process(delta: float) -> void:
	pass

func start_game() -> void:
	var p = pipe.instance()
	pipes.append(p)
	p.position = Vector2(250,250)
	p.linear_velocity = Vector2(-100,0)
	add_child(p)
	pipe_timer.start()
