extends Node2D

onready var animation_player = get_node("AnimationPlayer")

func fade() -> void:
	animation_player.play("fade_to_nothing")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if(anim_name == "fade_to_nothing"):
		queue_free()
