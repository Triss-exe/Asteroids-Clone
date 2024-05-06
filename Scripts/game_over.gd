extends Control

@onready var score_label = $score
@onready var highscore_label = $highscore

func _physics_process(delta: float) -> void:
	var score = LifeScoreManager.score
	var highscore = LifeScoreManager.highscore
	
	score_label.text = str("SCORE - " + str(score))
	highscore_label.text = str("HIGHSCORE - " + str(highscore))
	


func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	LifeScoreManager.reset_score()
