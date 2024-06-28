extends CardFunctions


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$AnimationPlayer.play("hover")
	# We keep resetting the head's position, which is setting its position to (0,0) then (0,-10), etc.
	# This would likely be solved if we moved a child node instead, as its position would still be relative to
	# the position of the parent node.
	# You can move Sprite2Ds with "offset" instead of "position."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
