extends Area2D

var minX: float = 80.0
var maxX: float = 1080.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# pass
	var spawnPosition: Vector2 = get_spawn_position()
	print("Spawning at: %f, %f" % [spawnPosition.x, spawnPosition.y])
	
func get_spawn_position():
	var spawnPosition: Vector2 = Vector2(get_position())
	spawnPosition.x = randf_range(minX, maxX)
	return spawnPosition
