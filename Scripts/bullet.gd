extends Node2D

var speed: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(delta * speed * -1)


func _on_area_2d_area_entered(area):
	queue_free() # Replace with function body.
