extends Area2D

static var BUTTON_LEFT = 1

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()

func on_click():
	var card_head = get_parent().get_parent()
	print("Click registered on ", card_head)
	var Target_Line = get_node("/root/Node2D/TargettingLine")
	#print("TARGET:", Target_Line)
	Target_Line.draw(card_head)
	
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print("CLICKABLE AREA STATUS REPORT. ROOT:", get_node("/root"), " CHILDREN OF ROOT,", get_node("/root").get_children())
	#print("NODE2D:", get_node("/root/Node2D"), " TARGET:", get_node("/root/Node2D/TargettingLine"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
