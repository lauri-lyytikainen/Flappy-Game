extends Node2D

onready var animation_player = get_node("AnimationPlayer")
onready var timer = get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Play_button_pressed() -> void:
	animation_player.play("hide_main_menu")
	var world = find_parent("World")
	world.find_node("Player").move_to_starting_position()
	timer.start()


func _on_Timer_timeout() -> void:
	var world = find_parent("World")
	world.game_started = true
	world.start_game()
	queue_free()
