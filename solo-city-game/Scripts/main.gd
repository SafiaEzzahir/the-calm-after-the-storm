extends Node2D

const rockscene = preload("res://rock.tscn")
const branchscene = preload("res://branch.tscn")

var rocks = []
var branches = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Campfire.activated.connect($Player._on_campfire_activated)
	$Player.rocks_and_wood.connect($Campfire._on_rocks_and_wood)
	$Campfire.activated.connect($Player._on_campfire_activated)
	$Player.rocks_and_wood.connect($Campfire._on_rocks_and_wood)
	
	for i in range(1, 11):
		var rock = rockscene.instantiate()
		rocks.append(rock)
		add_child(rock)
		rock.collected.connect($Player._on_rock_collected)
		rock.position = Vector2(rock.position.x + i*10, rock.position.y + i *10)
		
	for i in range(1, 11):
		var branch = branchscene.instantiate()
		branches.append(branch)
		add_child(branch)
		branch.collected.connect($Player._on_branch_collected)
		branch.position = Vector2(branch.position.x + i*100, branch.position.y + i*100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
