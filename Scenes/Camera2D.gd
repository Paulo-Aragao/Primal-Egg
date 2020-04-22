extends Camera2D

var fixed_toggle_point = Vector2(0,0)

var currently_moving_map = false

func _ready():
	set_camera_limits()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) or Input.is_mouse_button_pressed(BUTTON_MIDDLE):
		# This happens once 'move_map' is pressed
		if( !currently_moving_map ):
			var ref = get_viewport().get_mouse_position()
			fixed_toggle_point = ref
			currently_moving_map = true
		# This happens while 'move_map' is pressed
		move_map_around()
	else:
		currently_moving_map = false

# this stays the same
func move_map_around():
	var ref = get_viewport().get_mouse_position()
	self.global_position.x -= (ref.x - fixed_toggle_point.x)
	self.global_position.y -= (ref.y - fixed_toggle_point.y)
	fixed_toggle_point = ref


func set_camera_limits():
	var map_limits = Rect2(-800,-600,2800,1700)
	var map_cellsize = Vector2(1,1)
	
	limit_left = map_limits.position.x * map_cellsize.x
	limit_right = map_limits.end.x * map_cellsize.x
	limit_top = map_limits.position.y * map_cellsize.y
	limit_bottom = map_limits.end.y * map_cellsize.y
