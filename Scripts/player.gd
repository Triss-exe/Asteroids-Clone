extends CharacterBody2D

@export var rotation_speed = 5
@onready var bullet_scene = preload("res://Scenes/bullet.tscn")
@onready var star_power_scene = preload("res://Scenes/star_power.tscn")
signal bullet_spawned(bullet_instance)
var shoot_timeout = true
var speed = 20
var velocity_vector = Vector2(1, 0)
var max_speed = 200
var stopped_thrusting = false
signal player_died
signal star_power_spawned(star_power_instance)
var player_lives = 0



func _physics_process(delta: float) -> void:
	

	screen_wrap()
	
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("thrust"):
		stopped_thrusting = false
		velocity += velocity_vector.rotated(rotation) * speed * delta
	if velocity.x > max_speed:
		velocity.x = max_speed
	if velocity.x < -max_speed:
		velocity.x = -max_speed
	if velocity.y > max_speed:
		velocity.y = max_speed
	if velocity.y < -max_speed:
		velocity.y = -max_speed
	if Input.is_action_just_released("thrust"):
		stopped_thrusting = true
	if stopped_thrusting == true:
		velocity = velocity.move_toward(Vector2.ZERO, 2)
	
	if Input.is_action_just_pressed("shoot"):
		if shoot_timeout == true:
			shoot_timeout = false
			shoot()
			await get_tree().create_timer(0.3).timeout
			shoot_timeout = true
	if Input.is_action_pressed("shoot"):
		if shoot_timeout==true:
			shoot_timeout = false 
			shoot()
			await get_tree().create_timer(0.3).timeout
			shoot_timeout = true
	var power_meter_full = LifeScoreManager.power_meter_full
	if Input.is_action_just_pressed("power"):
		if power_meter_full == true:
			activate_star_power()
			LifeScoreManager.power_meter_used()
	move_and_slide()
	
	var lives = LifeScoreManager.lives
	player_lives = lives 

func shoot():
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_position = global_position
	bullet_instance.rotation = rotation 
	emit_signal("bullet_spawned", bullet_instance)
	
func activate_star_power():
	var star_power_instance = star_power_scene.instantiate()
	star_power_instance.global_position = global_position
	emit_signal("star_power_spawned" , star_power_instance)
	
func screen_wrap():
	if position.x <= -10:
		position.x = get_viewport_rect().size.x
	if position.x >= get_viewport_rect().size.x + 10:
		position.x = 0
	if position.y >= get_viewport_rect().size.y + 10:
		position.y = 0
	if position.y <= -10:
		position.y = get_viewport_rect().size.y
		
func die():
	if player_lives >= 1:
		SignalManager.emit_player_died()
		get_tree().call_deferred("reload_current_scene")
	if player_lives < 2: 
		SignalManager.emit_game_over()
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/game_over.tscn")
		
