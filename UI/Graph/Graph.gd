extends Control

var drag = false
var min_pan = Vector2(-2000, 2000)
var max_pan = Vector2(2000, -2000)

export var graph_size: Vector2 = Vector2(100, 100)
export var unit: int = 100

export var min_zoom = Vector2(0.1, 0.1)
export var max_zoom = Vector2(2, 2)

onready var camera = $Camera2D
onready var grid = $Grid
onready var zoom_tween = $Camera2D/ZoomTween

func _ready():
	grid.size = unit
	grid.grid_size = graph_size * unit * 2
	grid.position = -grid.grid_size/2
	min_pan.x = -(graph_size.x*unit)/2
	min_pan.y = (graph_size.y*unit)/2
	max_pan.x = (graph_size.x*unit)/2
	max_pan.y = -(graph_size.y*unit)/2
	

func _zoom(dir: int):
	var new_zoom = camera.zoom + Vector2(0.1, 0.1) * dir
	if new_zoom >  min_zoom and  new_zoom < max_zoom:
		zoom_tween.interpolate_property(camera, "zoom", camera.zoom, new_zoom, 0.05, 0, 0)
		zoom_tween.start()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed: drag = true
			else: drag = false
		if event.button_index == BUTTON_WHEEL_UP:
			_zoom(-1)
		if event.button_index == BUTTON_WHEEL_DOWN:
			_zoom(1)
		
	if event is InputEventMouseMotion:
		if drag:
			var to_move = camera.offset-(event.relative*camera.zoom)
			if to_move.x > min_pan.x and  to_move.x < max_pan.x:
				if to_move.y < min_pan.y and  to_move.y > max_pan.y:
					camera.offset = to_move
