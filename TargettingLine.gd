extends Line2D

var cached_card = null
@onready var triangle = $Triangle

var draw_line = false

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_points()
	triangle.set("visible", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if cached_card != null:
	if draw_line == true:
		var slightly_short_of_mouse = ((get_global_mouse_position() * 10) + (get_point_position(0) * 1)) / 11
		#set_point_position(1, get_global_mouse_position()) # set the end point to always be where the mouse is
		#triangle.set("position", get_global_mouse_position())
		#triangle.look_at(get_global_mouse_position())
		set_point_position(1, slightly_short_of_mouse)
		triangle.set("position", slightly_short_of_mouse)
		triangle.look_at(get_global_mouse_position())
	
	#set_point_position(1, Vector2(15,15)) # Set point at index 1 to position 15,15
	# You can remove both points in a line and the line won't destroy itself.
	# Then you can add 2 points to make a new line.
	#remove_point(1)
	#remove_point(0)
	#add_point(Vector2(56, 157))
	#add_point(Vector2(200, 15))
func set_point(p):
	triangle.set("visible", true)
	add_point(p) # point 0 will be static
	add_point(p) # point 1 will update in _process
	draw_line = true
		
func set_no_points():
	triangle.set("visible", false)
	remove_point(0) # maybe just set visibility to false
	remove_point(0)
	draw_line = false
	
