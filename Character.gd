extends Sprite

var speed = 400
var path : PoolVector2Array = PoolVector2Array() setget set_path

func _ready():
	set_process(false)
	
func _process(delta):
	var step_distance = speed * delta
	print("i'm running.")
	move_along_path(step_distance)

func move_along_path(step_distance):
	var start_point = position
	if(path.size() == 0):
		set_process(false)
		
	for i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		if step_distance <= distance_to_next and step_distance > 0.0:
			position = start_point.linear_interpolate(path[0], \
			step_distance / distance_to_next)
			break
		start_point = path[0]
		path.remove(0)
		
	
func set_path(value):
	path = value
	if value.size() == 0:
		return
	set_process(true)
