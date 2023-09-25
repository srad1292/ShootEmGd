extends CanvasLayer

signal game_over
signal restart_game

const starting_lives: int = 3
const kill_score: int = 10

var lives: int = starting_lives
var score: int = 0
var game_over_sent = false

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_game()

func setup_game():
	lives = starting_lives
	score = 0
	game_over_sent = false
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
	if lives > 0:
		lives -= 1
		$Lives.text = str(lives)
		
	if lives == 0 && game_over_sent == false:
		game_over_sent = true
		game_over.emit()
		$Button.show()


func _on_enemy_spawner_enemy_killed():
	score += kill_score
	$Score.text = str(score)


func _on_button_pressed():
	$Button.hide()
	setup_game()
	restart_game.emit()
