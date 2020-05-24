tool
extends Box2D
class_name SpriteBox


export(StreamTexture) var stream_texture setget set_texture


onready var sprite :Sprite= $Sprite setget , get_sprite
func get_sprite() -> Sprite:
	if sprite == null:
		sprite = get_child(0)
	
	return sprite



export(bool) var centered := true setget set_centered
func set_centered(_centered):
	centered = _centered
	
	if centered:
		set_horizental_pivot_align(HORIZENTAL_PIVOT_ALIGN.CENTER)
		set_vertical_pivot_align(VERTICAL_PIVOT_ALIGN.CENTER)
	
	else:
		set_horizental_pivot_align(HORIZENTAL_PIVOT_ALIGN.LEFT)
		set_vertical_pivot_align(VERTICAL_PIVOT_ALIGN.UP)
	
	get_sprite().centered = centered
	
	resize()


func set_texture(texture):
	
	stream_texture = texture
	
	var image = Image.new()
	image.load(stream_texture.resource_path)

	var image_texture = ImageTexture.new()
	image_texture.create_from_image(image)
	
	get_sprite().texture = image_texture
	
	



func resize():
	set_size(get_sprite().texture.get_size())





func _on_Sprite_texture_changed():
	resize()
