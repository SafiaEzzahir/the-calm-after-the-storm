extends Node2D

var entered : bool = false
var entered_body

const needed_rocks = 8
const needed_wood = 8
var current_rocks = 0
var current_wood = 0
var time_elapsed = 0.0
var target_time = 0.25
var time : bool = false
var done : bool = false
var whoosh_played : bool = false
var whoosh_finished : bool = false

signal activated
signal decrease_wood
signal decrease_rocks

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		entered = true
		entered_body = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		entered = false
		
func _process(delta: float) -> void:
	if current_rocks != needed_rocks or current_wood != needed_wood:
		if entered:
			activated.emit()
			time_elapsed += delta
			if time_elapsed >= target_time:
				time = true
				time_elapsed = 0.0
			else:
				time = false
	else:
		done = true
	
	_animate_and_sound()

func _on_rocks_and_wood(rocks, wood):
	if rocks > 0 and current_rocks != needed_rocks:
		if time:
			current_rocks += 1
			decrease_rocks.emit(1)
	
	if wood > 1 and current_wood != needed_wood:
		if time:
			current_wood += 2
			decrease_wood.emit(2)

func _animate_and_sound():
	if done:
		if not whoosh_finished:
			if not whoosh_played:
				$Whoosh.play()
				whoosh_played = true
		else:
			if not $Crackler.playing:
				$Crackler.play()
		$Sprite2D.frame = 3

func _on_whoosh_finished() -> void:
	whoosh_finished = true
	get_parent().campfires_finished += 1
