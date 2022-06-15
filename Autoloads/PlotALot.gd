extends Node

onready var graph

func sin_x():
	var points = PoolVector2Array()
	var point = 1
	for i in range(-(graph.graph_size.x*graph.unit)/2, (graph.graph_size.x*graph.unit)/2):
		points.append(Vector2(i, sin(float(i)/graph.unit)*graph.unit))
	graph.plot(points)
#	var curve = Curve2D.new()
#	for i in graph.graph_size.x:
#		curve.add_point(Vector2((i*graph.unit), sin(i)*graph.unit))
#	var line = Line2D.new()
#	line.points = curve.tessellate(1, 1)
#	graph.add_child(line)
#	pass
