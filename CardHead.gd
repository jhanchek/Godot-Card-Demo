extends CardFunctions

func battlecry():
	set_atk(atk * 2)
	apply_effect("Howl", self, "Battlecry: Double this unit's attack")
	
func get_list(): # requests to be added to a list
	return "wcip"
	
func do_effect(card):
	if card.player == self.player:
		set_hp(hp + 1)
