extends Area2D

@onready var sprite = $Sprite2D
@onready var speed = randf_range(100, 200)

var movement_vector = Vector2(0, -1)


func _ready() -> void:
	rotation = randf_range(0, 2*PI)


func _physics_process(delta: float) -> void:
	global_position += movement_vector.rotated(rotation) * speed * delta
	screen_wrap()


func screen_wrap():
	if position.x <= -25:
		position.x = get_viewport_rect().size.x + 20
	if position.x >= get_viewport_rect().size.x + 25:
		position.x =  -20
	if position.y >= get_viewport_rect().size.y + 25:
		position.y = -20
	if position.y <= -25:
		position.y = get_viewport_rect().size.y +20

func explode():
	queue_free()



func _on_body_entered(body: Node2D) -> void:
	body.die()
