extends Node2D

const rockscene = preload("res://rock.tscn")
const branchscene = preload("res://branch.tscn")

var rocks = []
var branches = []
var rock_pos = [Vector2(0, 0), Vector2(1000, -900), Vector2(-1550, 300), Vector2(600, 970), Vector2(-1085, 350), Vector2(3735, 9), Vector2(70, 30), Vector2(60, 90), Vector2(7, -237), Vector2(567, -765), Vector2(40, -370), Vector2(-45, 800), Vector2(70, -350), Vector2(-56, 0), Vector2(-247, -365), Vector2(74, 369), Vector2(207, 25), Vector2(430, 3), Vector2(690, 420), Vector2(100, 30), Vector2(0, 0)]
var branch_pos = [Vector2(0, 0), Vector2(1500, -960), Vector2(-1530, 306), Vector2(700, 980), Vector2(-1385, 1350), Vector2(1735, 56), Vector2(767, 3567), Vector2(450, 780), Vector2(234, -2356), Vector2(587, -768), Vector2(43, -3980), Vector2(-45, 805), Vector2(230, -550), Vector2(-57, 89), Vector2(-2412, -365), Vector2(756, 579), Vector2(298, 45), Vector2(460, 12), Vector2(450, -567), Vector2(10, 3023), Vector2(0, 0)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("blink")
	
	_connect_signals()
	
	for i in range(1, 21):
		var rock = rockscene.instantiate()
		rocks.append(rock)
		add_child(rock)
		rock.collected.connect($Player._on_rock_collected)
		rock.position = rock_pos[i]
		
	for i in range(1, 11):
		var branch = branchscene.instantiate()
		branches.append(branch)
		add_child(branch)
		branch.collected.connect($Player._on_branch_collected)
		branch.position = branch_pos[i]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _connect_signals():
	var house_items = [$Campfire, $Campfire2, $campfire, $campfire2, $campfire3]
	
	for item in house_items:
		item.activated.connect($Player._on_campfire_activated)
		item.decrease_rocks.connect($Player._on_rocks_decrease)
		item.decrease_wood.connect($Player._on_wood_decrease)
		$Player.rocks_and_wood.connect(item._on_rocks_and_wood)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "blink":
		$Player/Blinker.free()
