extends Area2D

static var BUTTON_LEFT = 1

@onready var game_manager = get_node("/root").find_child("GameManager") # NOTE might not find the node correctly
@onready var player = null
@onready var card_head = get_parent().get_parent()

func _ready():
	pass
	
func set_player(p):
	player = p

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		#self.on_click()
		player.register_click(card_head)
	
func on_click():
	var where_am_i = card_head.get_parent().name
	if where_am_i == "BOARD":
		var Target_Line = get_node("/root/GameManager/TargettingLine")
		#print("TARGET:", Target_Line)
		Target_Line.draw(card_head)
	elif where_am_i == "HAND":
		print("PARENT:", get_parent().get_parent())
		get_parent().get_parent().reparent(get_node("/root/GameManager/BOARD"), false)
		print("PARENT:", get_parent().get_parent())
		get_node("/root/GameManager/HAND").move_cards()
		get_node("/root/GameManager/BOARD").move_cards()
		
		
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
