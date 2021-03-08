extends Node2D
onready var score_label = get_node("Node2D/VBoxContainer/CenterContainer/TextureRect/score_text")
onready var best_score_label = get_node("Node2D/VBoxContainer/CenterContainer/TextureRect/best_score_text")

func set_score(var score) -> void:
	score_label.text = str(score)
	
func set_best_score(var score) -> void:
	best_score_label.text = str(score)
	
func _on_ok_button_pressed() -> void:
	get_tree().reload_current_scene()
