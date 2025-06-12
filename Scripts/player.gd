extends CharacterBody2D

var speed = 200
var input_look_direction
var last_mouse_position
var mouse_position
@export var bullet: PackedScene
var can_shoot = true
var fire_rate = 0.300

func _init() -> void:
	pass

func get_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	input_look_direction = Input.get_vector("look_left", "look_right", "look_up", "look_down")
	
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	if last_mouse_position != mouse_position:
		look_at(mouse_position)
		last_mouse_position = mouse_position
	else:
		look_at(global_position + input_look_direction)
	
	if Input.is_action_pressed("fire") and can_shoot:
		shoot()
		
func shoot():
	can_shoot = false
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = $Marker2D.global_position
	bullet_instance.rotation = global_rotation 
	add_sibling(bullet_instance)
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
