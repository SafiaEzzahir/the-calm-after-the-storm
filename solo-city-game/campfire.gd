extends Node2D

var entered : bool = false
var entered_body

const needed_rocks = 24
const needed_wood = 24
var current_rocks = 0
var current_wood = 0

signal activated

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		entered = true
		entered_body = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		entered = false
		
func _process(delta: float) -> void:
	if entered:
		activated.emit()

func _on_rocks_and_wood(rocks, wood):
	pass
