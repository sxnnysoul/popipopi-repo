extends Node2D

@export var EnemyScene : PackedScene



func _on_timer_timeout() -> void:
	var enemy = EnemyScene.instantiate()
	enemy.global_position = Vector2(randi_range(0, 1200), randi_range(0, 1200))
	add_sibling(enemy)
	
