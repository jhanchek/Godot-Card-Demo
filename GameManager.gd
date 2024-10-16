extends Node2D

@onready var player_one = $Player1
@onready var player_two = $Player2
@onready var current_player = player_one

@onready var line = $TargettingLine
var when_card_is_played_list = []

var cached_card = null
var opp_cached_card = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://cardStats.csv", FileAccess.READ)
	print(file.get_as_text())
	print(file.get_csv_line())
	print(file.get_csv_line())
	file.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func is_my_turn(player):
	return current_player == player
	
func targetting_system(target):
	if target.get_parent() == current_player:
		if cached_card == null:
			cached_card = target
			line.set_point(cached_card.position)
		else:
			target_deselect()
	elif cached_card != null:
		cached_card.attack(target)
		cached_card = null
		target_deselect()
		
func target_deselect():
	cached_card = null
	line.set_no_points()
	
func add_to_list(card, list):
	if list == "wcip":
		when_card_is_played_list.append(card)
		
func remove_from_list(card):
	if when_card_is_played_list.has(card):
		print("REMOVING CARD")
		when_card_is_played_list.remove_at(when_card_is_played_list.find(card))
	
func when_card_is_played(c):
	for card in when_card_is_played_list:
		#print("ACTIVATED")
		card.do_effect(c)
		
func pass_turn():
	SignalBus.turn_end.emit(current_player)
	if current_player == player_one:
		current_player = player_two
	elif current_player == player_two:
		current_player = player_one
	
# TODO
# Players have a deck, a hand, a board, and a graveyard
# The game manager handles swapping player turns
# If a card is drawn, the manager checks that player's deck list and finds a card (or sees that the deck is empty)
# It then sees if the player's hand has space. Q: What do you do about drawing when your hand is full?
# NOTE Deck can have func "is_empty()->bool" Hand can have a function called "is_full(int)->bool" etc
# If a card is clicked, see if it's in the current player's hand or board.
# If in hand, see if it can be moved to board.
# If on board, track it for targetting logic.
# NOTE should there even be a HAND and BOARD or should all cards just float together?
# NOTE when a card_move is going to take place, generate all current and new card positions.
# Then lerp() all cards between old and new positions.
