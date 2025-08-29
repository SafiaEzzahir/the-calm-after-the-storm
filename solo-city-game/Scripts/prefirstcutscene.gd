extends Node2D

var anim_finished : bool = false

func _ready() -> void:
	$AnimationPlayer.play("storm")

func _process(delta: float) -> void:
	if anim_finished:
		get_tree().change_scene_to_file("res://Scripts/firstcutscene.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim_finished = true
