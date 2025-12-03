extends CharacterBody3D

@onready var nav_Agent = $NavigationAgent3D
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
const speed: float = 4.0 

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var next_location = nav_Agent.get_next_path_position()
	var current_location = global_transform.origin
	var new_velocity = (velocity - current_location).normalized() * speed
	
	velocity= velocity.move_toward(new_velocity,0.25)
	move_and_slide()

func target_position(target):
	nav_Agent.target_position = target
