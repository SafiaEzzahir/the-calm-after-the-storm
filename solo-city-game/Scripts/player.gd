extends CharacterBody2D

@export var speed = 80

var left := false
var right := false
var up := false
var down := false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var position_change = _move(delta)
	
	_get_direction(position_change)
	_animate()
	
func _move(delta):
	#get direction from player input:
	var position_change = Input.get_vector("a_direction", "d_direction", "w_direction", "s_direction") * speed * delta
	velocity = position_change * speed
	move_and_slide()
	return position_change
	
func _get_direction(position_change):
	#check x direction
	if position_change.x < 0:
		left = true
		right = false
	elif position_change.x > 0:
		left = false
		right = true
	else:
		left = false
		right = false
	
	#check y direction
	if position_change.y < 0:
		up = true
		down = false
	elif position_change.y > 0:
		up = false
		down = true
	else:
		up = false
		down = false

func _animate():
	if down:
		if left:
			pass
		elif right:
			pass
		else:
			$Sprite2D/AnimationPlayer.play("walking_down")
	elif up:
		if left:
			pass
		elif right:
			pass
		else:
			pass
	else:
		$Sprite2D/AnimationPlayer.play("idle")
