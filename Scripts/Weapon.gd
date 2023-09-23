extends Node2D

const bullet_scene = preload("res://Scenes/bullet.tscn")

var fireCounter: int = 0
var delay: float = 0.1
var elapsed: float = delay

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	
func _input(event):
	if(event.is_action_pressed("ui_accept") && elapsed >= delay):
		fireCounter += 1
		elapsed = 0.0
		var bullet = bullet_scene.instantiate()
		bullet.position = $"../PlayerBody".get_position()
		add_child(bullet)
