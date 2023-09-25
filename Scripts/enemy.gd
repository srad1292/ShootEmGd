extends Node2D

signal killed

var maxSpeed: float = 360
var minSpeed: float = 200
var speed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = randf_range(minSpeed, maxSpeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(delta * speed)


func _on_area_2d_area_entered(area):
	if area.is_in_group("EnemyShredder"):
		#print("Enemy collided with enemy shredder")
		queue_free()
	elif area.is_in_group("Bullet"):
		#print("Enemy collided with bullet")
		killed.emit()
		queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		print("Enemy collided with player")
		queue_free()
