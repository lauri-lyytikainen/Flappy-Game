extends Node2D

onready var animation_player = get_node("AnimationPlayer")
onready var timer = get_node("Timer")
var instructions = preload("res://Objects/UI_elements/Instructions.tscn")
var play_button_pressed = false

func _on_Play_button_pressed() -> void:
	play_button_pressed = true
	animation_player.play("hide_main_menu")
	var world = find_parent("World")
	world.find_node("Player").move_to_starting_position()
	timer.start() #Is for the "Tap" instruction


func _on_Timer_timeout() -> void:
	add_child(instructions.instance())

func _unhandled_input(event: InputEvent) -> void:
	if play_button_pressed and event.is_action("jump"):
		timer.stop()
		start_game()

func start_game() -> void:
	var world = find_parent("World")
	world.game_started = true
	world.start_game()
	queue_free()
