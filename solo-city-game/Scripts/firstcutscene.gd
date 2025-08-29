extends Node2D

var blinked = false
var blinked2 = false
var timer = 0.0
var blinked_amount = 0

func _process(delta: float) -> void:
	if not blinked:
		$AnimationPlayer.play("blink")
	if blinked and not blinked2:
		$AnimationPlayer.play_backwards("blink")
	
	if blinked and blinked2:
		timer += delta
		if timer >= 2.0:
			blinked = false
			blinked2 = false
			timer = 0
			
	if blinked_amount == 2:
		$Ocean.texture = load("res://images/ocean.jpeg")
	elif blinked_amount >= 4:
		get_tree().change_scene_to_file("res://Scripts/game.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "blink" and not blinked:
		blinked = true
		blinked_amount += 1
	elif anim_name == "blink":
		blinked2 = true
