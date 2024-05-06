extends Node2D

var lives = 3
var score = 0
var highscore = 0
var power_meter = 0
var power_meter_full = false


func _physics_process(delta: float) -> void:
	print(power_meter)
	print(power_meter_full)
	if score > highscore:
		highscore = score 
	if power_meter > 18:
		power_meter_full = true

func _ready() -> void:
	get_node("/root/SignalManager").connect("player_died", _on_player_died)
	
func _on_player_died():
	lives -= 1

func enemy_killed():
	score += 100
	if power_meter < 19:
		power_meter += 1
	
func reset_score():
	score = 0
	
func power_meter_used():
	power_meter = 0
	power_meter_full = false
	
	
