extends Node2D

onready var pipe_timer = get_node("pipe_timer")
var pipe = preload("res://Objects/Pipe.tscn")
var pipes = []
var speed = 2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()


func _process(delta: float) -> void:
	for p in pipes:
		if p != null:
			if p.position.x < 0:
				p.queue_free()

func start_game() -> void:
	create_pipe(speed)
	pipe_timer.start()

func create_pipe(var pipe_speed) -> void:
	var p = pipe.instance()
	pipes.append(p)
	p.position = Vector2(250,250)
	p.speed = pipe_speed
	add_child(p)

func stop_game() -> void:
	pipe_timer.stop()
	for p in pipes:
		if p != null:
			p.active = false

func _on_pipe_timer_timeout() -> void:
	create_pipe(speed)
	pipe_timer.start()
