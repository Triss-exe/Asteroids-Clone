extends Node

signal player_died 
signal game_over

func emit_player_died():
	emit_signal("player_died")

func emit_game_over():
	emit_signal("game_over")
	
