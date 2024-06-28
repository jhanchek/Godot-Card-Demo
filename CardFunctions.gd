extends Node2D
class_name CardFunctions

# Note to self: Maybe instead, the template is the main head, and alternative functions are added with
# something resembling the Strategy Pattern: https://www.youtube.com/watch?v=sZDJJeDNe_M

@onready var template = $CardTemplate
@onready var atk = template.get("base_atk")
@onready var hp = template.get("base_hp")

func _ready():
	pass

func battlecry():
	pass

func _process(delta):
	pass
	
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
		var current_parent = get_parent()
		if current_parent.has_method("move_cards"):
			reparent(get_node("/root/Node2D/GRAVEYARD"))
			#print("PARENT HAS METHOD!")
			current_parent.move_cards()
		queue_free()
		
func before_attack():
	pass
	
func after_attack():
	pass
	
