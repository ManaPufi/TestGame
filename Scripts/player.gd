extends Node2D

func _draw():
	var size = Vector2(64, 64)
	var half = size / 2.0
	draw_rect(Rect2(-half, size), Color.BLACK)

var targetPosition: Vector2
var moving := false
var speed := 1000

func _ready():
	var tilePos = Vector2i(20, 5)
	var tileMap = get_parent().get_node("TileMap")
	position = tileMap.map_to_local(tilePos)
	targetPosition = position

func _process(delta):
	if moving:
		position = position.move_toward(targetPosition, speed * delta)
		if position.distance_to(targetPosition) < 1.0:
			position = targetPosition
			moving = false

func set_target(tileMap: TileMap, mapPos: Vector2i):
	targetPosition = tileMap.map_to_local(mapPos)
	moving = true
