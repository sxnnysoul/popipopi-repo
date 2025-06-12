extends Area2D

var speed = 1800
var direction = Vector2.ZERO

func _ready():
	direction = Vector2.RIGHT.rotated(rotation)

func _process(delta):
	position += direction * speed * delta 
	await get_tree().create_timer(5).timeout
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()
