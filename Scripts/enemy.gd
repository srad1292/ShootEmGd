extends Node2D

var maxSpeed: float = 380
var minSpeed: float = 180
var speed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = randf_range(minSpeed, maxSpeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(delta * speed)
