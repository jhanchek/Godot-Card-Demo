extends Node2D

var player_name = "Anton"

var left_bound = 100
var right_bound = 1500
var hand_y = 905
var board_y = 654

var max_hand_size = 7
var max_board_size = 7

var deck_list = [
	"card_head",
	"card_head_two",
	"card_head",
	"card_head_two",
	"card_head",
	"card_head_two",
	"card_head",
	"card_head_two"
]
var hand = []
var board = []
var graveyard = []

var card_positions = {}

@onready var line = get_node("/root/GameManager/TargettingLine")
var cached_card = null

@onready var GameManager = get_parent()

func _ready():
	var deck_file = FileAccess.open("res://deck_lists/deck_list_zero.txt", FileAccess.READ)
	
	deck_list.clear()
	while deck_file.get_position() < deck_file.get_length():
		deck_list.append(deck_file.get_line())
	
	deck_file.close()

func _process(delta):
	for card in card_positions:
		card.set("global_position", lerp(card.position, card_positions[card], 0.1))
		
	for card in graveyard:
		card.set("global_position", lerp(card.position, Vector2(-200, 610), 0.1))

func _on_button_pressed():
	if !deck_list.is_empty() and len(hand) < max_hand_size:
		var top_card = deck_list.pop_at(0)
		var loaded_card = load("res://" + top_card + ".tscn")
		var new_card = loaded_card.instantiate()
		add_child(new_card)
		hand.append(new_card)
		new_card.set("global_position", Vector2(1708,610))
		
		set_new_card_positions()
		
func set_new_card_positions():
	card_positions.clear()
	
	var num_of_cards_float: float = len(hand) - 1.0
	if num_of_cards_float < 1.0:
		num_of_cards_float = float(1.0)
	for i in len(hand):
		card_positions[hand[i]] = Vector2(
				lerp(left_bound, right_bound, i/(num_of_cards_float)),
				hand_y
			)
		
	num_of_cards_float = len(board) - 1.0
	if num_of_cards_float < 1.0:
		num_of_cards_float = float(1.0)
	for i in len(board):
		card_positions[board[i]] = Vector2(
				lerp(left_bound, right_bound, i/(num_of_cards_float)),
				board_y
			)
		
func register_click(card):
	if hand.has(card):
		if len(board) < max_board_size:
			put_into_play(card)
	elif board.has(card):
		targetting_system(card)
		#pass
		#var Target_Line = get_node("/root/GameManager/TargettingLine")
		#Target_Line.draw(card)
		# add to targetting system
		
func put_into_play(card):
	var index = hand.find(card)
	board.append(hand.pop_at(index))
	set_new_card_positions()
	
func targetting_system(target):
	if cached_card == null:
		cached_card = target
		line.set_point(cached_card.position)
	else:
		if cached_card != target:
			cached_card.attack(target)
		cached_card = null
		line.set_no_points()
		
func move_to_graveyard(card):
	var index = board.find(card)
	graveyard.append(board.pop_at(index))
	set_new_card_positions()
	
	
	
