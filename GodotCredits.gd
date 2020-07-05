extends Node2D

const section_time := 2.0
const line_time := 0.3
const base_speed := 100
const speed_up_multiplier := 10.0
const title_color := Color.red

var scroll_speed := base_speed
var speed_up := false

onready var line := $CreditsContainer/Line
var started := false
var finished := false

onready var ParallaxLayer = $ParallaxBackground/ParallaxLayer
onready var ParallaxLayer2 = $ParallaxBackground/ParallaxLayer2
onready var ParallaxLayer3 = $ParallaxBackground/ParallaxLayer3
onready var ParallaxLayer4 = $ParallaxBackground/ParallaxLayer4

onready var ParallaxLayer5 = $ParallaxBackground/ParallaxLayer5

onready var ParallaxLayer6 = $ParallaxBackground/ParallaxLayer6

onready var ParallaxLayer7 = $ParallaxBackground/ParallaxLayer7

#func _ready() -> void:
#	set_process(false)
	

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
	


var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"A game by Brenchri"
	],[
		"Programming",
		"Christoph"
	],[
		"Art",
		"peony",
		"Sanderfrenken",
		"Luke Mehl",
		"Johannes Sjölund",
		"Marcel van de Steeg",
		"Manuel Riecke",
		"Thane Brimhall",
		"Matthew Krohn",
		"Lori Angela Nagel",
		"Lanea Zimmerman (aka Sharm)",
		"Stephen Challener (aka Redshrike)",
		"Daniel Eddeland",
		"Shaun Williams",
		"Joe White",
		"Mark Weyer",
		"Barbara Rivera",
		"JRConway3",
		"JaidynReiman",
		"Nila122",
		"neo4cat6"
	],[
		"Music",
		"Matthew Pablo",
		"Zefz"
	],[
		"Fonts",
		"Alagard by Hewett Tsoi"
	],[
		"Sound Effects",
		"Will be implemented"
	],[
		"Testers",
		"Gabriel",
		"Miriam"
	],[
		"Tools used",
		"Developed with Godot Engine",
		"https://godotengine.org/license",
		"",
		"Art created and modified with Aseprite",
		"https://aseprite.org"
	],[
		"Special thanks",
		"My parents",
		"My friends",
		"And the Godot community"
	],[
		"Find whole credits",
		"https://github.com/Brenchri/pixelAdventures"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		#get_tree().change_scene("res://scenes/MainMenu.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false


func _on_TextureButton_pressed():
	get_tree().change_scene("res://titleScreen.tscn")
