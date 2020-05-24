tool
extends Box2D


onready var title_label = $Title


func init(title: String, _size: Vector2):
	
	size = _size
	title_label.text = title
	
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	
	if not can_debug:
		draw_rect(Rect2(Vector2(), size), Color.white, false)
