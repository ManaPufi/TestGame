extends TileMap

var tile_data = {
	"S": {"Type": "Stone", "tileID": 0},
	"G": {"Type": "Grass", "tileID": 1}, 
	"W": {"Type": "Water", "tileID": 2},
	"E": {"Type": "Event", "tileID": 3},
	"L": {"Type": "Lever", "tileID": 4},
	"P": {"Type": "Plant", "tileID": 5},
	"F": {"Type": "FishingPole", "tileID": 6},
	"B": {"Type": "Bridge", "tileID": 7},
	"C": {"Type": "Carrot", "tileID": 8},
	"I": {"Type": "Boulder", "tileID": 9},
	"D": {"Type": "Bonfire", "tileID": 10},
	"R": {"Type": "Crown", "tileID": 11},
	"T": {"Type": "Trap", "tileID": 12}
}

# Reverse map from tileID to type info for lookup
var tile_id_to_type = {}

func _ready():
	for key in tile_data:
		tile_id_to_type[tile_data[key]["tileID"]] = tile_data[key]["Type"]

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var local_mouse_pos = to_local(event.position)
		var tile_pos = local_to_map(local_mouse_pos)
		var source_id = get_cell_source_id(0, tile_pos)

		if source_id != -1:
			var atlas_coords = get_cell_atlas_coords(0, tile_pos)

			# We assume source_id corresponds to tileID
			if tile_id_to_type.has(source_id):
				var tile_type = tile_id_to_type[source_id]
				print("Hovered tile at ", tile_pos, ": Type = ", tile_type, ", Atlas Coord = ", atlas_coords)
