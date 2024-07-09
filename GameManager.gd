extends Node2D

@onready var player_one = $PlayerOne
@onready var player_two = $PlayerTwo
@onready var current_player = player_one

var when_card_is_played_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_to_list(card, list):
	if list == "wcip":
		when_card_is_played_list.append(card)
		
func remove_from_list(card):
	if when_card_is_played_list.has(card):
		print("REMOVING CARD")
		when_card_is_played_list.remove_at(when_card_is_played_list.find(card))
	
func when_card_is_played():
	for card in when_card_is_played_list:
		print("ACTIVATED")
		card.do_effect()
	
	
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
