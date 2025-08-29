extends Node2D

var rocks = 0
var wood = 0

signal rocks_and_wood

func _on_rock_collected() -> void:
	rocks += 1
	$CharacterBody2D/Control/RockLabel.text = str(rocks)

func _on_branch_collected():
	wood += 3
	$CharacterBody2D/Control/WoodLabel.text = str(wood)

func _on_campfire_activated():
	rocks_and_wood.emit(rocks, wood)

func _on_rocks_decrease(amount):
	rocks -= amount
	$CharacterBody2D/Control/RockLabel.text = str(rocks)

func _on_wood_decrease(amount):
	wood -= amount
	$CharacterBody2D/Control/WoodLabel.text = str(wood)
