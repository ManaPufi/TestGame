extends TileMap

var Dic = {}
var mapLayout = []
var lastHoveredTile: Vector2i = Vector2i(-1, -1)

var tileData = {
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

func _ready():
	mapLayout = load_map_from_file("res://Maps/TestMap.txt")
	generate_map_from_layout()
	
func load_map_from_file(path: String) -> Array:
	var layout = []
	if not FileAccess.file_exists(path):
		push_error("Map file not found: %s" % path)
		return layout

	var file = FileAccess.open(path, FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		layout.append(line)
	return layout

func generate_map_from_layout():
	for y in range(mapLayout.size()):
		var row = mapLayout[y]
		for x in range(row.length()):
			var detail = row[x]
			var tileDetails = tileData.get(detail, null)
			if tileDetails == null:
				continue

			var pos = Vector2i(x, y)
			Dic[str(pos)] = {
				"Type": tileDetails["Type"],
				"Position": str(pos)
			}
			set_cell(0, pos, tileDetails["tileID"], Vector2i(0, 0), 0)

func _process(_delta):
	var tile = local_to_map(get_global_mouse_position())

	if tile != lastHoveredTile:
		lastHoveredTile = tile
		
		for y in range(mapLayout.size()):
			for x in range(mapLayout[y].length()):
				erase_cell(1, Vector2i(x, y))

		if Dic.has(str(tile)):
			set_cell(1, tile, 98, Vector2i(0, 0), 0)
			print(Dic[str(tile)])
