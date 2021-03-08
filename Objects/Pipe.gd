extends KinematicBody2D

var difficulty = 1
var active = true
onready var upper_pipe = get_node("Upper Pipe")
onready var lower_pipe = get_node("Lower Pipe")
onready var audi_player = get_node("AudioStreamPlayer2D")
var passed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = (randf()-0.5)
	position.y += (r) * 250
	var g = randf()*20
	upper_pipe.position.y = -195-int(g)
	lower_pipe.position.y = 195+int(g)

func _physics_process(delta: float) -> void:
	if difficulty == 0:
		difficulty = 1
		upper_pipe.position.y = -200
		lower_pipe.position.y = 200
		position.y = 200
	if active:
		if position.x <= 135 and !passed:
			audi_player.play()
			passed = true
			get_parent().add_score()
		move_and_collide(Vector2(-difficulty-1,0))
		if position.x < -64:
			queue_free()
