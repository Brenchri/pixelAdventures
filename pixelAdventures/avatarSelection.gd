extends Node2D


onready var avatar = $avatar	

func openAvatar(fileName):
	var tex = ImageTexture.new ()
	var img = Image.new ()
	img.load (fileName)
	tex.create_from_image (img) # .import is created

func _on_FileDialog_file_selected(path):
	#var tex = ImageTexture.new ()
	#var img = Image.new ()
	#img.load (path)
	#tex.create_from_image (img) # .import is created
	#avatar.tex.create_from_image (img) 
	avatar.texture = load(path)
	#var image = Image.new()
	#var err = image.load(path)
	#if err != OK:
	# Failed
#		texture = ImageTexture.new()
#		texture.create_from_image(image, 0)


func _on_TextureButton_pressed():
	$FileDialog.popup()
