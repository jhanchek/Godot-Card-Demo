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
	print(target)
	target.take_damage(atk) # deal damage to foe
	take_damage(target.atk) # take damage in return
	
func take_damage(damage):
	hp = hp - damage
	template.set_hp_num(hp)
	if hp <= 0:
		queue_free()
	
