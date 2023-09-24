extends CanvasLayer

signal game_over

var lives: int = 3
var score: int = 0
var kill_score: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Lives.text = str(lives)
	$Score.text = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_damage_taken():
	handle_live_lost()


func _on_enemy_shredder_enemy_escaped():
	handle_live_lost()

func handle_live_lost():
	lives -= 1
	if lives >= 0:
		$Lives.text = str(lives)
	else:
		game_over.emit()


func _on_enemy_spawner_enemy_killed():
	score += kill_score
	$Score.text = str(score)
