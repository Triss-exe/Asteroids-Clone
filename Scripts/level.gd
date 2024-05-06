extends Node2D

@onready var player = $player
@onready var large_asteroid_scene = preload("res://Scenes/large_asteroid.tscn")
@onready var pos1 = $spawn_positions/pos1
@onready var pos2 = $spawn_positions/pos2
@onready var pos3 = $spawn_positions/pos3
@onready var pos4 = $spawn_positions/pos4

func _ready() -> void:
	get_node("/root/SignalManager").connect("player_died", _on_player_died)

func _physics_process(delta: float) -> void:
	pass
	

func _on_player_bullet_spawned(bullet_instance) -> void:
	add_child(bullet_instance)
    # comment for giggles
	bullet_instance.global_position = player.global_position
	
func spawn_large_asteroid():
	var spawn_points_aray = [pos1, pos2, pos3, pos4]
	var random_spawn_position = spawn_points_aray.pick_random()
	var large_asteroid_instance = large_asteroid_scene.instantiate()
	large_asteroid_instance.global_position = random_spawn_position.global_position
	get_tree().get_root().get_node("level/Asteroids").add_child(large_asteroid_instance)

func _on_timer_timeout() -> void:
	spawn_large_asteroid()

func _on_player_died():
	pass


func _on_player_star_power_spawned(star_power_instance: Variant) -> void:
	add_child(star_power_instance)
