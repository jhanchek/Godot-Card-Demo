extends CardFunctions

func deathrattle():
	var cards = player.get_cards_on_board()
	for card in cards:
		card.set_hp(card.hp + 1)
		card.apply_effect("Final Rally", self, "Deathrattle: +1 HP to all allies")
