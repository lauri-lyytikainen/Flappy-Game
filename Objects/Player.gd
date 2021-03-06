extends KinematicBody2D

var gravity = Vector2(0,0.5)
var jump_strength = 6
var velocity = Vector2.ZERO
var max_speed = 3
var alive = true
onready var animation_player = get_node("AnimationPlayer")

var menu_position = Vector2(220, 70)
var starting_position = Vector2(135, 240)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_mask = 0b00000000000000001110
	position = menu_position

func move_to_starting_position() -> void:
	position = starting_position

func _process(delta: float) -> void:
	if get_parent().game_started:
		gameplay_physics()

func gameplay_physics() -> void:
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
			die()
	
	#Sprite rotation
	var rotation = (velocity.y - max_speed) / (-jump_strength - max_speed) * (-30 - 30) + 30
	rotation_degrees = rotation

func die() -> void:
			velocity.x = 3
			get_parent().stop_game()
			collision_mask = 0b00000000000000001100
			alive = false
			get_parent().player_alive = false
			animation_player.play("dead")
