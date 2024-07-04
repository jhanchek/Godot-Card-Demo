extends Button

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
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if len(deck_list) <= 0:
		return
	var top_card = deck_list.pop_at(0)
	print("top_card: ", top_card)
	print("res://" + top_card + ".tscn")
	var loaded_card = load("res://" + top_card + ".tscn")
	#var loaded_card = load("res://card_head.tscn")
	var new_card = loaded_card.instantiate()
	var hand = get_node("/root/GameManager/HAND")
	hand.add_child(new_card)
	hand.move_cards()
	#new_card.reparent(get_node("/root/Node2D/HAND"))
	#print(new_card)
