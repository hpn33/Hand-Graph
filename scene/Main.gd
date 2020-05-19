extends Node2D

var nod_instance = preload("res://object/nod/nod.tscn")
var lin_instance = preload("res://object/lin/lin.tscn")
var space_instance = preload("res://object/space/space.tscn")

onready var label_layout = $Labels
onready var connection_layout = $Connections
onready var space_layout = $Spaces

var labels := []
var connections := []
var spaces := []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	
	for key in data.term.keys():
		var space = add_space(key)
		
		for c in data.term[key]:
			add_nod(c, space.size)
	
	
#	for index in data.title.size():
#
#		add_nod(data.title.keys()[index])
	
	
	for index in data.chart.size():
		
		if not data.chart[data.chart.keys()[index]] is Dictionary:
			continue
		
		for target in data.chart[data.chart.keys()[index]]:
			add_connection(data.chart.keys()[index], target)
		
	

var number = 0

func add_nod(id, rang):
	
	if rang == null:
		rang = get_tree().root.get_viewport().size
	
	var nod = nod_instance.instance()
	
	nod.init(id)
	nod.rect_position = Vector2(rand_range(0, rang.x), rand_range(0, rang.y))
	
	labels.append(nod)
	label_layout.add_child(nod)
	
	number += 1


func add_connection(from_id, to_id):
	
	var pos_temp := [0,0]
	
	for label in labels:
		if label.id == from_id:
			pos_temp[0] = label.rect_position
		
		
		if label.id == to_id:
			pos_temp[1] = label.rect_position
			
	
	var connect_line = lin_instance.instance()
	connect_line.init(from_id, to_id)
	connect_line.add_point(pos_temp[0]) 
	connect_line.add_point(pos_temp[1]) 
	
	connections.append(connect_line)
	connection_layout.add_child(connect_line)
	

func add_space(title):
	
	var space = space_instance.instance()
	
	space_layout.add_child(space)
	spaces.append(space)
	
	space.init(title, Vector2(400, 400))
	
	return space






