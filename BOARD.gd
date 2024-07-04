extends Node2D

@onready var cards = get_children()
@onready var left_bound = 100
@onready var right_bound = 1800
@onready var vertical_position = position.y
# Called when the node enters the scene tree for the first time.
func _ready():
	move_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#card.set("global_position", position)
	#cards[0].set("global_position", Vector2(left_bound, vertical_position))
	#cards[1].set("global_position", position)
	#cards[2].set("global_position", Vector2(right_bound, vertical_position))
	
func move_cards():
	cards = get_children()
	#print(cards)
	var num_of_cards = len(cards)
	var num_of_cards_float: float = float(num_of_cards-1)
	if num_of_cards_float < 1.0:
		num_of_cards_float = float(1)
	
	for i in num_of_cards:
		cards[i].set("global_position", Vector2(
			#(800*(i / (num_of_cards_float - 1)))+151,
			lerp(left_bound, right_bound, i/(num_of_cards_float)),
			vertical_position
		))
		#print(cards[i].get("global_position"))
		
func send_to_graveyard(target: CardFunctions):
	pass
	
