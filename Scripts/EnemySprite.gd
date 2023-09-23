extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if $"../../..".get_position().x <= 0:
		rotate(PI/2.0)
	else:
		rotate(PI/2.0*-1)

