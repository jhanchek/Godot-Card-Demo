extends Node2D

@export var card_name: String = "SAMPLETEXT"
@export var base_atk: int = 0
@export var base_hp: int = 0
@onready var name_text = $NameText
@onready var hp_text = $HpText
@onready var atk_text = $AtkText


func _ready():
	name_text.text = card_name
	set_atk_num(base_atk)
	set_hp_num(base_hp)

func _process(delta):
	pass
	
func set_atk_num(num):
	atk_text.text = (str(num))
	
func set_hp_num(num):
	hp_text.text = (str(num))
