extends Node
#class_name b_effects

func burn(card):
	card.take_damage(1)
	
func buff(card, atk, hp):
	pass
	#card.atk += atk
	#card.hp += hp
	#SignalBus.card_buffed.emit(a,h)
