extends CharacterBody2D

@export var speed: float = 100.0
var degrees = -300

func _init() -> void:
	add_to_group("enemy")

func _process(_delta):
	if $"../Player":
		var direction = ($"../Player".position - position).normalized()
		velocity = direction * speed
		move_and_slide()
	if $"../Player":
		var direction = ($"../Player".position - position).normalized()
		$"Hammer".position = direction * speed
		if $"Hammer".position - position > Vector2(40, 40).normalized():
			$"Hammer".position = $"Hammer".position
		if $"Hammer".global_position.x - global_position.x > 0:
			$"Hammer".flip_h = true
		else:
			$"Hammer".flip_h = false
	
	# Hammer animation
	
	$Hammer.global_rotation_degrees += degrees * _delta
	if $Hammer.global_rotation_degrees < -50:
		degrees = 300
	elif $Hammer.global_rotation_degrees > 50:
		degrees = -300




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == $"../Player":
		body.call_deferred("queue_free")
		get_tree().call_deferred("reload_current_scene")
