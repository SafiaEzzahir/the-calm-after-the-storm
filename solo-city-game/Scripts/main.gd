extends Node2D

const rockscene = preload("res://rock.tscn")
var rocks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(1, 11):
		var rock = rockscene.instantiate()
		rocks.append(rock)
		add_child(rock)
		rock.collected.connect($Player._on_rock_collected)
		rock.position = Vector2(rock.position.x + i*10, rock.position.y + i *10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
