extends CharacterBody2D

@export var speed: float = 100.0

func _init() -> void:
	add_to_group("enemy")
	
func _process(delta):
	if $"../Player":
		var direction = ($"../Player".position - position).normalized()
		velocity = direction * speed
		move_and_slide()
