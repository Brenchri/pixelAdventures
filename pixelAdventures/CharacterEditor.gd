extends Control

var faceDir
# load body

onready var skin = $Panel/character/skin
onready var hair = $Panel/character/hair
onready var beard = $Panel/character/beard
onready var wound = $Panel/character/wound
onready var nose = $Panel/character/nose
onready var ears = $Panel/character/ears
onready var iris = $Panel/character/iris
onready var sclera = $Panel/character/sclera
onready var horns = $Panel/character/horns

onready var beardList= $Panel/beardList
onready var hairList = $Panel/hairList
onready var skinList = $Panel/skinList
onready var noseList = $Panel/noseList
onready var woundList = $Panel/woundList
onready var earsList = $Panel/earsList
onready var irisList = $Panel/irisList
onready var scleraList = $Panel/scleraList
onready var hornsList = $Panel/hornsList

var selectedHairStyle
var selectedBeardStyle
var selectedSkinStyle
var selectedNoseStyle
var selectedWoundStyle
var selectedEarsStyle
var selectedIrisStyle
var selectedScleraStyle
var selectedHornsStyle

var hairStyle = "none"
var skinStyle = "human"
var beardStyle = "none"
var noseStyle = "none"
var woundStyle = "none"
var earsStyle = "elvenears"
var irisStyle = "iris"
var scleraStyle = "sclera"
var hornsStyle = "none"

var hairColor = "FFDBAC"
var beardColor = "FFDBAC"
var skinTone = "FFDBAC"
var noseColor= "FFDBAC"
var earsColor = "00000"
var scleraColor = "FFFFFF"
var irisColor = "FFFFFF"
var woundColor = "FFFFFF"
var hornsColor = "FFFFFF"

var hairStyles = ["bangs", "bangslong", "bangsshort", "bedhead", "bunches","halfmessy", "none", "Jewfro", "long", "longhawk", "longknot", "loose", "male_braid","male_curly", "male_single", "messy", "messy2", "mohawk", "page", "page2", "parted2", "pixie", "plain", 
"ponytail", "ponytail2", "princess", "shorthawk","shortknot", "shoulderl","shoulderr", "swoop","unkept", "xlong", "xlongknot",  ]
var beardStyles = ["beard", "bigstache", "mustache", "none"]
var skinStyles = ["human", "drake", "skeleton", "zombie", "woman", "eisenmann", "orc"]
var noseStyles = ["bignose", "buttonnose", "straightnose", "none"]
var woundStyles = ["arm_blood","brain_blood", "mouth_blood","none", "ribs_blood", "Male_Bandage"]
var earsStyles = ["elvenears", "bigears", "none"]
var irisStyles = ["iris", "none"]
var scleraStyles = ["sclera", "none"]
var hornsStyles = ["none", "horns1", "horns2"]

func _ready():
	load_sprite()
	load_beard_styles_list()
	load_hair_styles_list()
	load_skin_styles_list()
	load_nose_styles_list()
	load_wound_styles_list()
	load_ears_styles_list()
	load_iris_styles_list()
	load_sclera_styles_list()
	load_horns_styles_list()
	load_feet_styles_list()
	load_arms_styles_list()
	load_bracelet_style_list()
	load_hands_styles_list()
	load_face_styles_list()
	load_torso_u_styles_list()
	load_torso_o_styles_list()
	load_waist_styles_list()
	load_shoulders_styles_list()
	load_misc_styles_list()
	load_legs_styles_list()
	load_head_styles_list()
	
	for button in get_tree().get_nodes_in_group("color_btns"):
		button.connect("pressed", self, "_colorButtonPressed", [button])	



func load_hair_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/hair/placeholder.png"
	
	for i in hairStyles.size():
		var temp_icon = icon_path.replace("placeholder", hairStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		hairList.add_item("",icon)
		
func load_skin_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/skin/placeholder.png"
	
	for i in skinStyles.size():
		var temp_icon = icon_path.replace("placeholder", skinStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		skinList.add_item("",icon)

func load_beard_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/beard/placeholder.png"
	
	for i in beardStyles.size():
		var temp_icon = icon_path.replace("placeholder", beardStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		beardList.add_item("",icon)
		
func load_nose_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/nose/placeholder.png"
	
	for i in noseStyles.size():
		var temp_icon = icon_path.replace("placeholder", noseStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		noseList.add_item("",icon)
		
func load_wound_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/wound/placeholder.png"
	
	for i in woundStyles.size():
		var temp_icon = icon_path.replace("placeholder", woundStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		woundList.add_item("",icon)
		
func load_ears_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/ears/placeholder.png"
	
	for i in earsStyles.size():
		var temp_icon = icon_path.replace("placeholder", earsStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		earsList.add_item("",icon)
		
func load_iris_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/iris/placeholder.png"
	
	for i in irisStyles.size():
		var temp_icon = icon_path.replace("placeholder", irisStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		irisList.add_item("",icon)
		
func load_sclera_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/sclera/placeholder.png"
	
	for i in scleraStyles.size():
		var temp_icon = icon_path.replace("placeholder", scleraStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		scleraList.add_item("",icon)
		
func load_horns_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Appearance/previews/horns/placeholder.png"
	
	for i in hornsStyles.size():
		var temp_icon = icon_path.replace("placeholder", hornsStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		hornsList.add_item("",icon)

func _on_hairColorPicker_color_changed(color):
	hair.modulate = color
	hairColor = color
	

func _on_skinColorPicker_color_changed(color):
	skin.modulate = color
	skinTone = color
	ears.modulate = color
	earsColor = color
	
func _on_beardColorPicker_color_changed(color):
	beard.modulate = color
	beardColor = color
	
func _on_noseColorPicker_color_changed(color):
	nose.modulate = color
	noseColor = color
	
func _on_scleraColorPicker_color_changed(color):
	sclera.modulate = color
	scleraColor = color

func _on_irisColorPicker_color_changed(color):
	iris.modulate = color
	irisColor = color
	
func _on_woundColorPicker_color_changed(color):
	wound.modulate = color
	woundColor = color
	
func _on_hornsColorPicker_color_changed(color):
	horns.modulate = color
	hornsColor = color

func load_sprite():
	face("Idle_S")
	setHairTo(hairStyle)
	hair.modulate = hairColor
	setBeardTo(beardStyle)
	beard.modulate = hairColor
	setSkinTo(skinStyle)
	skin.modulate = skinTone
	setNoseTo(noseStyle)
	nose.modulate = skinTone
	setWoundTo(woundStyle)
	setEarsTo(earsStyle)
	setIrisTo(irisStyle)
	setScleraTo(scleraStyle)
	setHornsTo(hornsStyle)
	ears.modulate = skinTone
	setArmsTo(armsStyle)
	setHeadTo(headStyle)
	setShouldersTo(shouldersStyle)
	setFaceTo(faceStyle)
	setMiscTo(miscStyle)
	setWaistTo(waistStyle)
	setHandsTo(handsStyle)
	setArmsTo(armsStyle)
	setTorso_oTo(torso_oStyle)
	setTorso_uTo(torso_uStyle)
	setLegsTo(legsStyle)
	setSkirtTo(skirtStyle)
	setBraceletTo(braceletStyle)
	setFeetTo(feetStyle)
	
func setHairTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/hair/" + style + ".png"
	hair.texture = load(path)
	hairStyle = style
	
func setSkinTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/skin/" + style + ".png"
	skin.texture = load(path)
	skinStyle = style

func setBeardTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/beard/" + style + ".png"
	beard.texture = load(path)
	beardStyle = style
	
func setNoseTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/nose/" + style + ".png"
	nose.texture = load(path)
	noseStyle = style
	
func setWoundTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/wound/" + style + ".png"
	wound.texture = load(path)
	woundStyle = style
	
func setEarsTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/ears/" + style + ".png"
	ears.texture = load(path)
	earsStyle = style
	
func setIrisTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/iris/" + style + ".png"
	iris.texture = load(path)
	irisStyle = style
	
func setScleraTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/sclera/" + style + ".png"
	sclera.texture = load(path)
	scleraStyle = style
	
func setHornsTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Appearance/horns/" + style + ".png"
	horns.texture = load(path)
	hornsStyle = style
	
func _on_beardList_item_selected(index):
	setBeardTo(beardStyles[index])
	
func _on_hairList_item_selected(index):
	setHairTo(hairStyles[index])
	
func _on_noseList_item_selected(index):
	setNoseTo(noseStyles[index])
	
func _on_skinList_item_selected(index):
	setSkinTo(skinStyles[index])

func _on_woundList_item_selected(index):
	setWoundTo(woundStyles[index])
	
func _on_earsList_item_selected(index):
	setEarsTo(earsStyles[index])
	
func _on_irisList_item_selected(index):
	setIrisTo(irisStyles[index])
	
func _on_scleraList_item_selected(index):
	setScleraTo(scleraStyles[index])
	
func _on_hornsList_item_selected(index):
	setHornsTo(hornsStyles[index])
	
func _on_leftArrow_pressed():
	match faceDir:
		"Idle_S":
			face("Idle_W")
		"Idle_W":
			face("Idle_N")
		"Idle_N":
			face("Idle_E")
		"Idle_E":
			face("Idle_S")

func _on_rightArrow_pressed():
	match faceDir:
		"Idle_S":
			face("Idle_E")
		"Idle_E":
			face("Idle_N")
		"Idle_N":
			face("Idle_W")
		"Idle_W":
			face("Idle_S")

func face(direction:String):
	var frame
	match direction:
		"Idle_S":
			frame = 26
			faceDir = "Idle_S"
		"Idle_N":
			frame = 0
			faceDir = "Idle_N"
		"Idle_W":
			frame = 13
			faceDir = "Idle_W"
		"Idle_E":
			frame = 39
			faceDir = "Idle_E"
			
	skin.frame = frame
	wound.frame = frame
	nose.frame = frame
	hair.frame = frame
	beard.frame = frame
	ears.frame = frame
	iris.frame = frame
	sclera.frame = frame
	horns.frame = frame
	head.frame = frame
	face.frame = frame
	legs.frame = frame
	misc.frame = frame
	waist.frame = frame
	hands.frame = frame
	arms.frame = frame
	feet.frame = frame 
	torso_u.frame = frame
	torso_o.frame = frame


func _on_Beard_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.show()
	$Panel/earsList.hide()
	$Panel/noseList.hide()
	$Panel/beardColorPicker.show()
	$Panel/woundColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()
	
func _on_Hair_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.show()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/beardColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/hairColorPicker.show()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()
	
func _on_Skin_pressed():
	$Panel/irisList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.show()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/beardColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.show()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()

func _on_Nose_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.show()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/beardColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.show()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()
	
func _on_Wound_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.show()
	$Panel/earsList.hide()
	$Panel/beardColorPicker.hide()
	$Panel/woundColorPicker.show()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()

func _on_Ears_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.show()
	$Panel/beardColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()

func _on_Eyes_pressed():
	$Panel/irisList.show()
	$Panel/scleraList.show()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/beardColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.show()
	$Panel/scleraColorPicker.show()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()
	
func _on_Gear_pressed():
	$Control.hide()
	$gearControl.show()
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/hornsList.hide()
	$Panel/hornsColorPicker.hide()
	$Panel/beardColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/character.show()
	$avatar.hide()
	
func _on_Horns_pressed():
	$Panel/irisList.hide()
	$Panel/scleraList.hide()
	$Panel/hairList.hide()
	$Panel/skinList.hide()
	$Panel/beardList.hide()
	$Panel/noseList.hide()
	$Panel/woundList.hide()
	$Panel/earsList.hide()
	$Panel/hornsList.show()
	$Panel/beardColorPicker.hide()
	$Panel/hairColorPicker.hide()
	$Panel/woundColorPicker.hide()
	$Panel/skinColorPicker.hide()
	$Panel/noseColorPicker.hide()
	$Panel/irisColorPicker.hide()
	$Panel/scleraColorPicker.hide()
	$Panel/hornsColorPicker.show()
	
func _on_Body_pressed():
	$Control.show()
	$gearControl.hide()
	$Panel/character.show()
	$avatar.hide()
	
# load gear 
onready var face = $Panel/character/gear/face
onready var head = $Panel/character/gear/head
onready var hands = $Panel/character/gear/hands
onready var bracelet = $Panel/character/gear/bracelet
onready var arms= $Panel/character/gear/arms
onready var skirt = $Panel/character/gear/skirt
onready var legs = $Panel/character/gear/legs
onready var shoulders = $Panel/character/gear/shoulders
onready var misc = $Panel/character/gear/misc
onready var torso_u = $Panel/character/gear/torso_u
onready var torso_o = $Panel/character/gear/torso_o
onready var waist = $Panel/character/gear/waist
onready var feet = $Panel/character/gear/feet


onready var faceList= $gearControl/faceList
onready var headList = $gearControl/headList
onready var handsList = $gearControl/handsList
onready var braceletList = $gearControl/braceletList
onready var armsList = $gearControl/armsList
onready var skirtList = $gearControl/skirtList
onready var legsList = $gearControl/legsList
onready var shouldersList = $gearControl/shouldersList
onready var miscList = $gearControl/miscList
onready var torso_uList = $gearControl/torso_uList
onready var torso_oList = $gearControl/torso_oList
onready var waistList = $gearControl/waistList
onready var feetList = $gearControl/feetList

var selectedFaceStyle
var selectedHeadStyle
var selectedHandsStyle
var selectedBraceletStyle
var selectedArmsStyle
var selectedSkirttyle
var selectedLegstyle
var selectedShouldlerStyle
var selectedMiscStyle
var selectedTorso_uStyle
var selectedTorso_oStyle
var selectedWaistStyle
var selectedFeetStyle

var faceStyle = "none"
var headStyle = "none"
var handsStyle = "none"
var braceletStyle = "none"
var armsStyle = "none"
var skirtStyle = "none"
var legsStyle = "none"
var shouldersStyle = "none"
var miscStyle = "none"
var torso_uStyle = "none"
var torso_oStyle = "none"
var waistStyle = "none"
var feetStyle = "none"

var faceColor = "FFDBAC"
var headColor = "FFDBAC"
var handsTone = "FFDBAC"
var braceletColor= "FFDBAC"
var armsColor = "00000"
var skirtColor = "FFFFFF"
var legsColor = "FFFFFF"
var shouldersColor = "00000"
var miscColor = "FFFFFF"
var torso_uColor = "FFFFFF"
var torso_oColor = "FFFFFF"
var waistColor = "FFFFFF"
var feetColor = "FFFFFF"
var handsColor = "FFFFFF"

var faceStyles =  ["eyepatch", "glasses", "mask_male", "monocle", "sunglasses", "none"]
var headStyles = ["bandana", "barbarian-male", "barbuta-male", "chainhat-male", "chain_hood_male",
"crown", "formal_hat", "formal_tophat", "headband", "hood", "horned_helmet", "leather_cap_male", 
"legionhelmet", "legionhelmet2", "legionhelmet3", "lulhat", "magichat_male", "maximus-male", "moon-male",
"nomoon-male", "plate_helmet", "none"]
var handsStyles = ["bracers_male", "gloves_male", "none"]
var braceletStyles = ["bracelet", "none"]
var armsStyles = ["plate_arms", "none"]
var skirtStyles = ["Male_legionSkirt", "male_robe_bottom", "none"]
var legsStyles = ["none","formal_pants_stripes","plate_legs", "white_pants_male","pants"]
var shouldersStyles = ["Male_legionbauldron_steel", "plate_shoulder", "shoulders_male", "SingleBauldron", "none"]
var miscStyles = ["formal_bowtie", "formal_necktie", "male_cape", "Scarf", "wings", "none"]
var torso_uStyles = ["formal_shirt", "formal_stripes_shirt", "mail_male", "sleevless_white", "white_longsleeve", "none"]
var torso_oStyles = ["Apron_male", "chest_male", "formal_jacket brown", "formal_jacket tan", "formal_trenchcoat grey", 
"formal_vest", "formal_vest stripes", "mail_male", "Male_legionplate", "male_tabard", "plate_torso", "none"]
var waistStyles = ["formal_belt", "leather_male", "white_cloth_male", "none"]
var feetStyles = ["plate_shoes", "sandals_male", "shoes_male", "none"]

func load_face_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/face/placeholder.png"
	
	for i in faceStyles.size():
		var temp_icon = icon_path.replace("placeholder", faceStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		faceList.add_item("",icon)
		
func load_head_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/head/placeholder.png"
	
	for i in headStyles.size():
		var temp_icon = icon_path.replace("placeholder", headStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		headList.add_item("",icon)

func load_hands_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/hands/placeholder.png"
	
	for i in handsStyles.size():
		var temp_icon = icon_path.replace("placeholder", handsStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		handsList.add_item("",icon)
		
func load_bracelet_style_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/bracelet/placeholder.png"
	
	for i in braceletStyles.size():
		var temp_icon = icon_path.replace("placeholder", braceletStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		braceletList.add_item("",icon)
		
func load_arms_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/arms/placeholder.png"
	
	for i in armsStyles.size():
		var temp_icon = icon_path.replace("placeholder", armsStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		armsList.add_item("",icon)
		
func load_skirt_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/skirt/placeholder.png"
	
	for i in skirtStyles.size():
		var temp_icon = icon_path.replace("placeholder", skirtStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		skirtList.add_item("",icon)
		
func load_legs_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/legs/placeholder.png"
	
	for i in legsStyles.size():
		var temp_icon = icon_path.replace("placeholder", legsStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		legsList.add_item("",icon)
		
func load_shoulders_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/shoulders/placeholder.png"
	
	for i in shouldersStyles.size():
		var temp_icon = icon_path.replace("placeholder", shouldersStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		shouldersList.add_item("",icon)

func load_misc_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/misc/placeholder.png"
	
	for i in miscStyles.size():
		var temp_icon = icon_path.replace("placeholder", miscStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		miscList.add_item("",icon)

func load_torso_u_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/torso_u/placeholder.png"
	
	for i in torso_uStyles.size():
		var temp_icon = icon_path.replace("placeholder", torso_uStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		torso_uList.add_item("",icon)

func load_torso_o_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/torso_o/placeholder.png"
	
	for i in torso_oStyles.size():
		var temp_icon = icon_path.replace("placeholder", torso_oStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		torso_oList.add_item("",icon)

func load_waist_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/waist/placeholder.png"
	
	for i in waistStyles.size():
		var temp_icon = icon_path.replace("placeholder", waistStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		waistList.add_item("",icon)

func load_feet_styles_list():
	var icon_path = "res://Assets/spritesheets/Character/Male/Gear/previews/feet/placeholder.png"
	
	for i in feetStyles.size():
		var temp_icon = icon_path.replace("placeholder", feetStyles[i])
		var icon = ResourceLoader.load(temp_icon)
		feetList.add_item("",icon)




func setFaceTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/face/" + style + ".png"
	face.texture = load(path)
	faceStyle = style
	
func setHeadTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/head/" + style + ".png"
	head.texture = load(path)
	headStyle = style

func setHandsTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/hands/" + style + ".png"
	hands.texture = load(path)
	handsStyle = style
	
func setBraceletTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/bracelet/" + style + ".png"
	bracelet.texture = load(path)
	braceletStyle = style
	
func setArmsTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/arms/" + style + ".png"
	arms.texture = load(path)
	armsStyle = style
	
func setSkirtTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/skirt/" + style + ".png"
	skirt.texture = load(path)
	skirtStyle = style
	
func setShouldersTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/shoulders/" + style + ".png"
	shoulders.texture = load(path)
	shouldersStyle = style
	
func setLegsTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/legs/" + style + ".png"
	legs.texture = load(path)
	legsStyle = style
	
func setMiscTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/misc/" + style + ".png"
	misc.texture = load(path)
	miscStyle = style
	
func setTorso_uTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/torso_u/" + style + ".png"
	torso_u.texture = load(path)
	torso_uStyle = style
	
func setTorso_oTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/torso_o/" + style + ".png"
	torso_o.texture = load(path)
	torso_oStyle = style
	
func setWaistTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/waist/" + style + ".png"
	waist.texture = load(path)
	waistStyle = style
	
func setFeetTo(style):
	var path = "res://Assets/spritesheets/Character/Male/Gear/feet/" + style + ".png"
	feet.texture = load(path)
	feetStyle = style
	
func _on_faceList_item_selected(index):
	setFaceTo(faceStyles[index])
	
func _on_headList_item_selected(index):
	setHeadTo(headStyles[index])
	
func _on_handsList_item_selected(index):
	setHandsTo(handsStyles[index])
	
func _on_braceletList_item_selected(index):
	setBraceletTo(braceletStyles[index])

func _on_armsList_item_selected(index):
	setArmsTo(armsStyles[index])
	
func _on_skirtList_item_selected(index):
	setSkirtTo(skirtStyles[index])
	
func _on_shouldersList_item_selected(index):
	setShouldersTo(shouldersStyles[index])
	
func _on_legsList_item_selected(index):
	setLegsTo(legsStyles[index])
	
func _on_miscList_item_selected(index):
	setMiscTo(miscStyles[index])

func _on_torso_uList_item_selected(index):
	setTorso_uTo(torso_uStyles[index])
	
func _on_torso_oList_item_selected(index):
	setTorso_oTo(torso_oStyles[index])
	
func _on_feetList_item_selected(index):
	setFeetTo(feetStyles[index])
	
func _on_waistList_item_selected(index):
	setWaistTo(waistStyles[index])


func _on_face_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.show()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.show()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()
	
func _on_misc_pressed():
	$gearControl/miscList.show()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.show()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()

	
func _on_waist_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.show()
	$gearControl/headList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.show()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()


func _on_head_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.show()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.show()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()

	
func _on_hands_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.show()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.show()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()


func _on_arms_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.show()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.show()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()

func _on_torso_u_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.show()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.show()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()
	
func _on_torso_o_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.show()
	$gearControl/legsList.hide()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.show()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.hide()
	
func _on_legs_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.show()
	$gearControl/feetList.hide()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.hide()
	$gearControl/legsColorPicker.show()

func _on_feet_pressed():
	$gearControl/miscList.hide()
	$gearControl/waistList.hide()
	$gearControl/headList.hide()
	$gearControl/shouldersList.hide()
	$gearControl/handsList.hide()
	$gearControl/armsList.hide()
	$gearControl/faceList.hide()
	$gearControl/torso_uList.hide()
	$gearControl/torso_oList.hide()
	$gearControl/legsList.hide()
	$gearControl/feetList.show()
	$gearControl/miscColorPicker.hide()
	$gearControl/headColorPicker.hide()
	$gearControl/torso_uColorPicker.hide()
	$gearControl/torso_oColorPicker.hide()
	$gearControl/armsColorPicker.hide()
	$gearControl/handsColorPicker.hide()
	$gearControl/waistColorPicker.hide()
	$gearControl/faceColorPicker.hide()
	$gearControl/feetColorPicker.show()
	$gearControl/legsColorPicker.hide()
	
func _on_miscColorPicker_color_changed(color):
	misc.modulate = color
	miscColor = color

func _on_headColorPicker_color_changed(color):
	head.modulate = color
	headColor = color
	
func _on_torso_uColorPicker_color_changed(color):
	torso_u.modulate = color
	torso_uColor = color
	
func _on_torso_oColorPicker_color_changed(color):
	torso_o.modulate = color
	torso_oColor = color
	
func _on_armsColorPicker_color_changed(color):
	arms.modulate = color
	armsColor = color
	
func _on_handsColorPicker_color_changed(color):
	hands.modulate = color
	handsColor = color
	
func _on_waistColorPicker_color_changed(color):
	waist.modulate = color
	waistColor = color


func _on_faceColorPicker_color_changed(color):
	face.modulate = color
	faceColor = color

func _on_legsColorPicker_color_changed(color):
	legs.modulate = color
	legsColor = color

func _on_feetColorPicker_color_changed(color):
	feet.modulate = color
	feetColor = color


func _on_home_pressed():
	get_tree().change_scene("res://titleScreen.tscn")



func _on_VSlider_value_changed(value):
	pass # Replace with function body.



func _on_TextureButton_pressed():
	$Control.hide()
	$gearControl.hide()
	$avatar.show()
	$Panel/character.hide()
