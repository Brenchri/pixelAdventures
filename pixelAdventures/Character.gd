extends Sprite

var speed : = 100.0
var tile_size = 32
var path : = PoolVector2Array() setget set_path
var last_position = Vector2()
var target_position = Vector2()

var anim_direction = "S"
var anim_mode = "Idle"
var animation 
var moving = false
var move_direction
#onready var map : TileMap = $Map

func _ready() -> void:
	set_process(false)
	
	
func _process(delta: float) -> void:
	var move_distance : = speed * delta
	move_along_path(move_distance)
	AnimationLoop()
	
	


func move_along_path(distance : float) -> void:
	var last_point : = position
	for index in range(path.size()):
		var distance_to_next = last_point.distance_to(path[0])
		moving = false
		#print(moving)
		
		if distance <= distance_to_next and distance >= 0.0:
			moving = true
			#print(moving)
			position = last_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		#elif path.size() == 1 and distance >= distance_to_next:
			#if position[0] >= stepify(position[0],32):
				#if position[1] >= stepify(position[1],32):
				#	position = Vector2(stepify(position[0], 32)+16,stepify(position[1], 32)+16)
				#elif position[1] < stepify(position[1],32):
				#	position = Vector2(stepify(position[0], 32)+16,stepify(position[1], 32)-16)
					
			#elif position[0] < stepify(position[0],32):
			#	if position[1] < stepify(position[1],32):
			#		position = Vector2(stepify(position[0], 32)-16,stepify(position[1], 32)-16)
			#	elif position[1] >= stepify(position[1],32):
			#		position = Vector2(stepify(position[0], 32)-16,stepify(position[1], 32)+16)
				
			#position[1] = position[1]-16
			#position = position.snapped(Vector2(tile_size/2, tile_size/2))
			#print(position)
			set_process(false)
			break

		distance -= distance_to_next
		last_point = path[0]
		path.remove(0)
	move_direction = rad2deg(last_point.angle_to_point(position))
	print(move_direction)
	
func set_path(value : PoolVector2Array) -> void:
	if value.size() == 0:
		return
	path = value
	path.remove(0)
	set_process(true)

var inputs = {
	'up' : Vector2.UP,
	'down' : Vector2.DOWN,
	'right' : Vector2.RIGHT,
	'left' : Vector2.LEFT,
}
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	position += inputs[dir]*32

func AnimationLoop():
	if move_direction <= -135 or move_direction >= 135:  
		anim_direction = "E"
	elif move_direction <= -45 and move_direction >= -135:
		anim_direction = "S"
	elif move_direction <= 45 and move_direction > 0:
		anim_direction = "W"
	elif move_direction <= 0 and move_direction >= -45:
		anim_direction = "W"
	elif move_direction <= 135 and move_direction >= 45:
		anim_direction = "N"
	
	if moving == true: 
		anim_mode = "Walk"
	elif moving == false:
		anim_mode = "Idle"
	animation = anim_mode + "_" + anim_direction
	get_node("AnimationPlayer").play(animation)
	#print("I am walking")
