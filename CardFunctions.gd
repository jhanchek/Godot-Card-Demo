extends Node2D
class_name CardFunctions

# Note to self: Maybe instead, the template is the main head, and alternative functions are added with
# something resembling the Strategy Pattern: https://www.youtube.com/watch?v=sZDJJeDNe_M

@onready var template = $CardTemplate
@onready var atk = template.get("base_atk")
@onready var hp = template.get("base_hp")
@onready var player = null

func _ready():
	pass

func battlecry():
	pass

func _process(delta):
	pass
	
func set_player(p): # TODO set p: Player
	player = p
	template.find_child("ClickableArea").set_player(p)
	
# should be one "attack" function with optional "on_attack" and "on_defend" functions
# maybe there should be attack and defend, so that you can tell the difference when one card initiates.
func attack(target: CardFunctions):
	before_attack()
	target.take_damage(atk) # deal damage to foe
	#target.defend(self)
	after_attack(self, target)
	take_damage(target.atk) # take damage in return
	
func defend(attacker: CardFunctions):
	#print(self, " was attacked by ", attacker)
	pass
	
func take_damage(damage):
	if hp <= 0:
		return
	set_hp(hp - damage)
	if hp <= 0:
		SignalBus.card_dies.emit(self)
		player.move_to_graveyard(self)
		
func before_attack():
	pass
	
func after_attack(u, t):
	pass
	
func set_atk(a):
	atk = a
	template.set_atk_num(atk)
	
func set_hp(h):
	hp = h
	template.set_hp_num(hp)
	
func burn_self(p):
	#take_damage(1)
	get_node("/root/GameManager").queue_fast_action(take_damage.bind(1))
	
func disconnect_myself():
	var connections = get_incoming_connections()
	for c in connections:
		c.signal.disconnect(c.callable)
		
func _to_string():
	return str(template.card_name, " ", atk, "/", hp)
	
