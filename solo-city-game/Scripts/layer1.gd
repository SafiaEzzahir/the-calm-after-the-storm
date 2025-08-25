extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var filled_tiles := get_used_cells()
	for filled_tile : Vector2i in filled_tiles:
		var neighbouring_tiles := get_surrounding_cells(filled_tile)
		for neighbour : Vector2i in neighbouring_tiles:
			if get_cell_source_id(neighbour) == -1:
				set_cell(neighbour, 0, Vector2i(4, 19))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
