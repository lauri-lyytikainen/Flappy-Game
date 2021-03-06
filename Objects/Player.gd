extends KinematicBody2D

var gravity = Vector2(0,0.5)
var jump_strength = 6
var velocity = Vector2.ZERO
var max_speed = 3
var alive = true
onready var animation_player = get_node("AnimationPlayer")
onready var menu_animation_player = get_node("AnimationPlayer2")
var menu_text = preload("res://Objects/UI_elements/Game_name_text.tscn")
var menu_position = Vector2(240, 120)
var starting_position = Vector2(135, 240)
var menu_text_position = Vector2(-226, -24)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_mask = 0b00000000000000001110
	position = menu_position
	var t = menu_text.instance()
	t.position = menu_text_position
	add_child(t)

func move_to_starting_position() -> void:
	menu_animation_player.play("move_from_menu_to_ready")
	get_node("Game_title").fade()

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
