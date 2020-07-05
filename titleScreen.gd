extends Control

onready var ParallaxLayer = $ParallaxBackground/ParallaxLayer
onready var ParallaxLayer2 = $ParallaxBackground/ParallaxLayer2
onready var ParallaxLayer3 = $ParallaxBackground/ParallaxLayer3
onready var ParallaxLayer4 = $ParallaxBackground/ParallaxLayer4

onready var ParallaxLayer5 = $ParallaxBackground/ParallaxLayer5

onready var ParallaxLayer6 = $ParallaxBackground/ParallaxLayer6

onready var ParallaxLayer7 = $ParallaxBackground/ParallaxLayer7

func _ready() -> void:
	set_process(false)

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_x = event.position.x
		var mouse_y = event.position.y
		var relative_x = (mouse_x - (get_viewport().size.x/2)) / (get_viewport().size.x/2)
		var relative_y = (mouse_y - (get_viewport().size.y/2)) / (get_viewport().size.y/2)
		#ParallaxLayer.
		ParallaxLayer.motion_offset.y = 2.5 * relative_y
		ParallaxLayer.motion_offset.x = 2.5 * relative_x
		
		ParallaxLayer2.motion_offset.y = 5 * relative_y
		ParallaxLayer2.motion_offset.x = 5 * relative_x
		
		ParallaxLayer3.motion_offset.y = 20 * relative_y
		ParallaxLayer3.motion_offset.x = 20 * relative_x
		
		ParallaxLayer4.motion_offset.y = 25 * relative_y
		ParallaxLayer4.motion_offset.x = 25 * relative_x
		
		ParallaxLayer5.motion_offset.y = 10 * relative_y
		ParallaxLayer5.motion_offset.x = 10 * relative_x
		
		ParallaxLayer6.motion_offset.y = 30 * relative_y
		ParallaxLayer6.motion_offset.x = 30 * relative_x
		
		ParallaxLayer7.motion_offset.y = 60 * relative_y
		ParallaxLayer7.motion_offset.x = 60 * relative_x
		#ParallaxLayer.motion_offset(relative_x, relative_y)
		print(mouse_x)


func _on_TextureButton_pressed():
	get_tree().change_scene("res://CharacterEditor.tscn")


func _on_credits_pressed():
	get_tree().change_scene("res://GodotCredits.tscn")
