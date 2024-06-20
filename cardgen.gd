extends Card


# Called when the node enters the scene tree for the first time.
func _ready():
	var card_art = Sprite2D.new()
	card_art.texture = load(art)
	
	var atk_text = Label.new()
	var hp_text = Label.new()
	atk_text.text = ("ATK: " + str(atk))
	hp_text.text = ("HP: " + str(hp))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
