extends KinematicBody2D

var difficulty = 1 #Variable to adjust difficulty, not yet implemented
var active = true #If the pipe object should move
onready var upper_pipe = get_node("Upper Pipe")
onready var lower_pipe = get_node("Lower Pipe")
onready var audio_player = get_node("AudioStreamPlayer2D")
var passed = false # If the pipe object has passed the center of the screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = (randf()-0.5) #Random height offset
	position.y += (r) * 250
	var g = randf()*20 #Random gap size
	upper_pipe.position.y = -195-int(g)
	lower_pipe.position.y = 195+int(g)

func _physics_process(delta: float) -> void:
	if difficulty == 0: #Takes care of the first pipe. See World.gd
		difficulty = 1
		upper_pipe.position.y = -200
		lower_pipe.position.y = 200
		position.y = 200
	if active:
		if position.x <= 135 and !passed: #At the center of the screen
			audio_player.play() #Score sound
			passed = true
			get_parent().add_score()
		move_and_collide(Vector2(-difficulty-1,0)) #The movement
		if position.x < -64: #Despawning
			queue_free()
