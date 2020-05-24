extends Box2D
class_name Group2D



func remove_children():
	
	for child in get_children():
		remove_child(child)


func sort_children():
	pass


func first():
	return get_child(0)


func last():
	return get_child(get_child_count()-1)

