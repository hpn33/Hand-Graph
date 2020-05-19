tool
extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var title_label = $Title


var size := Vector2(10, 10)


func init(title: String, _size: Vector2):
	
	size = _size
	title_label.text = title
	
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	
	draw_rect(Rect2(Vector2(), size), Color.white, false)
