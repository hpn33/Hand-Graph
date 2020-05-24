tool
extends Group2D
class_name HBox2D


enum V_ALIGN { TOP, CENTER, DOWN }

export(V_ALIGN) var v_align := V_ALIGN.CENTER setget set_v_align

func set_v_align(_v_align):
	v_align = _v_align
	
	sort_children()



func get_y_position() -> float:
	
	var rect = in_rect()
	
	if v_align == V_ALIGN.TOP:
		return rect.position.y
	
	elif v_align == V_ALIGN.CENTER:
		return rect.position.y + rect.size.y /2
	
	elif v_align == V_ALIGN.DOWN:
		return rect.position.y + rect.size.y
	
	return 0.0


func sort_children():
	var x = 0
	for child in get_children():
		
		child.position.y = get_y_position()
		child.position.x = x
		
		x += child.width()
	
	resize()


func sort_from(index: int, diff: float):
	
	for i in get_child_count():
		var child = get_children()[i]
		
		child.position.y = get_y_position()
		
		if i > index:
			
			child.position.x += diff
	
	resize()


func resize():
	
	var y = 0
	var x = 0
	
	for child in get_children():
		y = max(y, child.height())
		x += child.width()
	
	if y == 0:
		size = Vector2.ONE * 100
	else:
		size = Vector2(x, y)
	
	
	repivot()


func reset():
	remove_children()
	resize()



