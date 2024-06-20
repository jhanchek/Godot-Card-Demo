extends Node
class_name Card

@export var card_name: String = "CARD"
@export var atk: int = 2
@export var hp: int = 5
@export var art: String = ('res://amateurdiscopng.png')
@onready var hp_text = $HpText
@onready var atk_text = $AtkText
@onready var sprite_image = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_image.texture = load(art)
	battlecry()
	atk_text.text = (str(atk))
	hp_text.text = (str(hp))
	
func battlecry():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func attack(target: Card):
	#print(target)
	take_damage(target.atk) # take damage from the foe
	target.take_damage(atk) # fire back
	
func defend(attacker: Card):
	take_damage(attacker.atk) # take damage from the foe
	attacker.take_damage(atk) # fire back
	
func take_damage(damage):
	hp = hp - damage
	hp_text.text = (str(hp))

func _on_button_pressed(a):
	var target = get_node(a)
	attack(target)
	#print(target)
	#take_damage(3)
	
	
	#print(self)
	#print(get_path())
	#var a = get_node("/root/Node2d/Node2")
	#print(a)
	#attack(a)
