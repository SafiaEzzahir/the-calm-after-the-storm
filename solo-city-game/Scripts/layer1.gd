extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var filled_tiles := get_used_cells()
	for filled_tile : Vector2i in filled_tiles:
		if not get_cell_tile_data(filled_tile).get_custom_data("ramp"):
			var neighbouring_tiles := get_surrounding_cells(filled_tile)
			for neighbour : Vector2i in neighbouring_tiles:
				if get_cell_source_id(neighbour) == -1:
					set_cell(neighbour, 1, Vector2i(11, 6))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
