extends Node2D

const rockscene = preload("res://rock.tscn")
const branchscene = preload("res://branch.tscn")

var rocks = []
var branches = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_signals()
	
	for i in range(1, 21):
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

func _connect_signals():
	var house_items = [$Campfire, $Campfire2]
	
	for item in house_items:
		item.activated.connect($Player._on_campfire_activated)
		item.decrease_rocks.connect($Player._on_rocks_decrease)
		item.decrease_wood.connect($Player._on_wood_decrease)
		$Player.rocks_and_wood.connect(item._on_rocks_and_wood)
