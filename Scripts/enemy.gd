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


func _on_area_2d_area_entered(area):
	print("Enemy on area 2d entered: %s" % area.get_name())
	if area.is_in_group("EnemyShredder"):
		print("Enemy collided with enemy shredder")
		# take a life away
		queue_free()
	elif area.is_in_group("Bullet"):
		print("Enemy collided with bullet")
		queue_free()


func _on_area_2d_body_entered(body):
	print("Enemy on area 2d body entered: %s" % body.get_name())
	if body.is_in_group("Player"):
		print("Enemy collided with player")
		#take a life away
		queue_free()
