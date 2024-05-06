extends Area2D

@onready var sprite = $Sprite2D
@onready var speed = randf_range(100, 150)
@onready var small_asteroid_scene = preload("res://Scenes/small_asteroid.tscn")

var movement_vector = Vector2(0, -1)


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
	spawn_small_asteroid() 
	spawn_small_asteroid()
	queue_free()
	

func spawn_small_asteroid():
	var small_asteroid_instance = small_asteroid_scene.instantiate()
	small_asteroid_instance.call_deferred("set_global_position", global_position)
	get_parent().call_deferred("add_child", small_asteroid_instance)




func _on_body_entered(body: Node2D) -> void:
	body.die()
