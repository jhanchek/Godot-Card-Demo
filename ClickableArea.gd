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
		player.register_click(card_head)
