extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("d_direction"):
		$AnimationPlayer.play("d")
	elif Input.is_action_just_pressed("s_direction"):
		$AnimationPlayer.play("s")
	elif Input.is_action_just_pressed("a_direction"):
		$AnimationPlayer.play("a")
	elif Input.is_action_just_pressed("w_direction"):
		$AnimationPlayer.play("w")
	elif Input.is_action_just_pressed("e_function"):
		$AnimationPlayer.play("e")

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scripts/main.tscn")
