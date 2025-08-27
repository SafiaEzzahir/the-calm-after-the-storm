extends Node2D

var rocks = 0

func _on_item_collider_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		print($CharacterBody2D.position)
		body.set_cell($CharacterBody2D.position, 0, Vector2i(1, 3))


func _on_rock_collected() -> void:
	rocks += 1
	$CharacterBody2D/Label.text = str(rocks)
