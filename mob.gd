extends CharacterBody3D

@onready var agent = $NavigationAgent3D
var SPEED = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = agent.get_next_path_position()
	
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
#	velocity = new_velocity
#	move_and_slide()
	
	agent.set_velocity(new_velocity)
#	agent.set_velocity(new_velocity)
	

func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	
	move_and_slide()
	
func update_target_location(target_location):
	agent.target_position = target_location
	


func _on_navigation_agent_3d_target_reached():
	pass # Replace with function body.


func _on_navigation_agent_3d_navigation_finished():
	pass # Replace with function body.
