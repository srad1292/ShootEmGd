extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Enemy and am at: %f, %f" % [get_position().x, get_position().y])
	if $"../../..".get_position().x <= 0:
		rotate(PI/2.0)
	else:
		rotate(PI/2.0*-1)

