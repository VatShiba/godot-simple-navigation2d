extends Node2D

onready var nav_2d = $Navigation2D
onready var line_2d = $Line2D
onready var character = $Character
	
func _unhandled_input(event: InputEvent):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.is_pressed():
		return
	var new_path = nav_2d.get_simple_path(character.global_position, \
	event.global_position)
	line_2d.points = new_path
	character.path = new_path # setget activated
