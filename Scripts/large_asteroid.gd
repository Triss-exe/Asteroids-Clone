extends Area2D

@onready var sprite = $Sprite2D
@onready var speed = randf_range(50, 100)
@onready var medium_asteroid_scene = preload("res://Scenes/medium_asteroid.tscn")

var movement_vector = Vector2(0, -1)

signal medium_spawned(medium_asteroid_instance)

func _ready() -> void:
	rotation = randf_range(0, 2*PI)


func _physics_process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation) * speed * delta
	screen_wrap()


func screen_wrap():
	if position.x <= -45:
		position.x = get_viewport_rect().size.x + 40
	if position.x >= get_viewport_rect().size.x + 45:
		position.x =  -40
	if position.y >= get_viewport_rect().size.y + 45:
		position.y = -40
	if position.y <= -45:
		position.y = get_viewport_rect().size.y +40

func explode():
	spawn_medium_asteroid() 
	spawn_medium_asteroid()
	queue_free()
	

func spawn_medium_asteroid():
	var medium_asteroid_instance = medium_asteroid_scene.instantiate()
	medium_asteroid_instance.call_deferred("set_global_position", global_position)
	get_parent().call_deferred("add_child", medium_asteroid_instance)
	


func _on_body_entered(body: Node2D) -> void:
	body.die()
