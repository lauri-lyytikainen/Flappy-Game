extends KinematicBody2D

var gravity = Vector2(0,0.5)
var jump_strength = 6
var velocity = Vector2.ZERO
var max_speed = 3
var alive = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_mask = 0b00000000000000001110


func _process(delta: float) -> void:
	velocity += gravity
	
	if Input.is_action_just_pressed("jump") and alive:
		velocity.y = -jump_strength
	if velocity.y > max_speed:
		velocity.y = max_speed
		
		
	if velocity.x > 0:
		velocity.x -= 0.1
	if velocity.x < 0:
		velocity.x = 0
		
		
	var collision = move_and_collide(velocity)
	if collision and alive:
		if "Pipe" in collision.collider.name or "Floor" in collision.collider.name:
			velocity.x = 3
			get_parent().stop_game()
			collision_mask = 0b00000000000000001100
			alive = false
	
	#Sprite rotation
	var rotation = (velocity.y - max_speed) / (-jump_strength - max_speed) * (-30 - 30) + 30
	rotation_degrees = rotation
