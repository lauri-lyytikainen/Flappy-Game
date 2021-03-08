extends Node2D
var next_scene = preload("res://Levels/World.tscn")
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene_to(next_scene)
