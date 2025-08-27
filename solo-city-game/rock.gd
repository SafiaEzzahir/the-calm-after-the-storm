extends Node2D

var filled : bool = false
signal collected

func _process(delta: float) -> void:
	if Input.is_action_pressed("e_function") and filled:
		print("being collected")
		collected.emit()
		self.free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		filled = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		filled = false
