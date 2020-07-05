extends Sprite


func _ready():
	var image = Image.new()
	image.load("res://Assets/avatars/zardoz.png")

	var tex = ImageTexture.new()
	tex.create_from_image(image)

	texture = tex
