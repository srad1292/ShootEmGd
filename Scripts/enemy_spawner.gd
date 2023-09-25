extends Node2D

signal enemy_killed

const enemyScene = preload("res://Scenes/enemy.tscn")

var minX: float = -450.0
var maxX: float = 450.0
var minDelay: float = 0.6
var maxDelay: float = 1.5
var timer: Timer = null
var shouldSpawn: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_timer()

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
	enemy.connect("killed", handle_enemy_killed)
	timer.set_wait_time(randf_range(minDelay, maxDelay))
	
func get_spawn_position():
	var spawnPosition: Vector2 = Vector2(get_position())
	spawnPosition.x = randf_range(minX, maxX)
	return spawnPosition
	
func handle_enemy_killed():
	enemy_killed.emit()


func _on_hud_game_over():
	timer.stop()
	shouldSpawn = false


func _on_hud_restart_game():
	shouldSpawn = true
	timer.start()
