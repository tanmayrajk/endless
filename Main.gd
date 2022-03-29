extends Node2D

export (PackedScene) var enemy_scene
onready var spawners = [$Spawner50, $Spawner150,  $Spawner250]
var score = 0
export (Vector2) var player_start_position
var is_game_running = false

func _ready():
	$BGMusic.play()
	randomize()
	new_game()
	
func spawn():
	var enemy = enemy_scene.instance()
	var spawner = spawners[randi() % spawners.size()]
	enemy.position = spawner.position
	add_child(enemy)

func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	spawn()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func game_over():
	$ExplosionSoundEffect.play()
	$HUD.hide_score()
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$SpawnTimer.stop()
	is_game_running = false

func new_game():
	score = 0
	$Player.start(player_start_position)
	$StartTimer.start()
	$HUD.show_score()
	$HUD.update_score(score)
	$HUD.hide_game_over()
	is_game_running = true
	get_tree().call_group("enemies", "queue_free")

func mute():
	pass

func _process(delta):
	if Input.is_action_just_pressed("restart") and is_game_running == false:
		$RestartSoundEffect.play()
		new_game()
	if Input.is_action_just_pressed("mute"):
		mute()


func _on_Player_moved():
	$MoveSoundEffect.play()
