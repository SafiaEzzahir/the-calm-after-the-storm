extends Node2D

func _on_play_button_down() -> void:
	get_tree().change_scene_to_file("res://Scripts/prefirstcutscene.tscn")

func _on_how_to_play_button_down() -> void:
	get_tree().change_scene_to_file("res://howtoplay.tscn")
