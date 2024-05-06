extends Control

@onready var score_label = $"score label"
@onready var lives_label = $"lives label"
@onready var highscore_label = $"highscore label"
@onready var power_meter_sprite = $power_meter_sprite

func _physics_process(delta: float) -> void:
	var score = LifeScoreManager.score
	var highscore = LifeScoreManager.highscore
	var lives = LifeScoreManager.lives
	score_label.text = str("SCORE - " + str(score))
	lives_label.text = str("LIVES - " + str(lives))
	highscore_label.text = str("HIGHSCORE - " + str(highscore))
	control_star_power_animation()
	
	
func control_star_power_animation():
	var power_meter = LifeScoreManager.power_meter
	if power_meter == 0:
		power_meter_sprite.play("0")
	if power_meter == 1:
		power_meter_sprite.play("1")
	if power_meter == 2:
		power_meter_sprite.play("2")
	if power_meter == 3:
		power_meter_sprite.play("3")
	if power_meter == 4:
		power_meter_sprite.play("4")
	if power_meter == 5:
		power_meter_sprite.play("5")
	if power_meter == 6:
		power_meter_sprite.play("6")
	if power_meter == 7:
		power_meter_sprite.play("7")
	if power_meter == 8:
		power_meter_sprite.play("8")
	if power_meter == 9:
		power_meter_sprite.play("9")
	if power_meter == 10:
		power_meter_sprite.play("10")
	if power_meter == 11:
		power_meter_sprite.play("11")
	if power_meter == 12:
		power_meter_sprite.play("12")
	if power_meter == 13:
		power_meter_sprite.play("13")
	if power_meter == 14:
		power_meter_sprite.play("14")
	if power_meter == 15:
		power_meter_sprite.play("15")
	if power_meter == 16:
		power_meter_sprite.play("16")
	if power_meter == 17:
		power_meter_sprite.play("17")
	if power_meter == 18:
		power_meter_sprite.play("18")
