extends KinematicBody2D

var gravity = Vector2(0,0.5)
var jump_strength = 6
var velocity = Vector2.ZERO
var max_speed = 3
var alive = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	velocity += gravity
	if Input.is_action_just_pressed("jump") and alive:
		velocity.y = -jump_strength
	if velocity.y > max_speed:
		velocity.y = max_speed
	var collision = move_and_collide(velocity)
	if collision and alive:
		if "Pipe" in collision.collider.name or "Floor" in collision.collider.name:
			get_parent().stop_game()
			alive = false
	
