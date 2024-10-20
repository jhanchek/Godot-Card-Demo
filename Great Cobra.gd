extends CardFunctions

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.card_dies.connect(on_card_died)
	SignalBus.turn_end.connect(on_turn_end)

func on_card_died(card): #NOTE that this activates in hand and in graveyard.
	set_atk(atk+1)
	
func on_turn_end(p):
	set_hp(hp+1)
	
func after_attack(u, t):
	SignalBus.turn_end.connect(t.burn_self) # This works
	#disconnect_myself()
	#SignalBus.turn_end.connect(t.take_damage.bind(1)) # TODO does this work?
	#SignalBus.turn_end.connect(BasicEffects.burn.bind(t)) # This does not work.

func _process(delta):
	pass

