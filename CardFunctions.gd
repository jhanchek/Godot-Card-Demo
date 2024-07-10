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
	print("DEF")

func _process(delta):
	pass
	
func set_player(p):
	player = p
	template.find_child("ClickableArea").set_player(p)
	
# should be one "attack" function with optional "on_attack" and "on_defend" functions
# maybe there should be attack and defend, so that you can tell the difference when one card initiates.
func attack(target: CardFunctions):
	before_attack()
	target.take_damage(atk) # deal damage to foe
	#target.defend(self)
	after_attack()
	take_damage(target.atk) # take damage in return
	
func defend(attacker: CardFunctions):
	#print(self, " was attacked by ", attacker)
	pass
	
func take_damage(damage):
	hp = hp - damage
	template.set_hp_num(hp)
	if hp <= 0:
		player.move_to_graveyard(self)
		
func before_attack():
	pass
	
func after_attack():
	pass
	
func set_atk(a):
	atk = a
	template.set_atk_num(atk)
	
func set_hp(h):
	hp = h
	template.set_hp_num(hp)
	
