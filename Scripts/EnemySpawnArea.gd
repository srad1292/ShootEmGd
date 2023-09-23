extends Area2D

const enemyScene = preload("res://Scenes/enemy.tscn")

var minX: float = -490.0
var maxX: float = 490.0
var minDelay: float = 1.2
var maxDelay: float = 2.1
var timer: Timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setup_timer():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", spawn_enemy)
	timer.set_one_shot(false)
	timer.set_wait_time(1)
	timer.start()
	
func spawn_enemy():
	var spawnPosition: Vector2 = get_spawn_position()
	#print("Spawning at: %f, %f" % [spawnPosition.x, spawnPosition.y])
	var enemy = enemyScene.instantiate()
	enemy.position = spawnPosition
	add_child(enemy)
	timer.set_wait_time(randf_range(minDelay, maxDelay))
	
func get_spawn_position():
	var spawnPosition: Vector2 = Vector2(get_position())
	spawnPosition.x = randf_range(minX, maxX)
	return spawnPosition
