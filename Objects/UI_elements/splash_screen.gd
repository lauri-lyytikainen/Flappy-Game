extends Node2D
var next_scene = preload("res://Levels/World.tscn")
onready var animation_player = get_node("AnimationPlayer")
onready var logo = get_node("ColorRect/CenterContainer/VBoxContainer/TextureRect")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if "show_logo" in anim_name:
		logo.texture.pause = false
		animation_player.play("hide_logo")
	elif "hide_logo" in anim_name:
		get_tree().change_scene_to(next_scene)
