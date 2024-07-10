extends CardFunctions

func battlecry():
	set_atk(atk * 2)
	
func get_list(): # requests to be added to a list
	return "wcip"
	
func do_effect(card):
	if card.player == self.player:
		set_hp(hp + 1)
