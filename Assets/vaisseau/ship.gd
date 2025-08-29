extends Node3D

const SPEED = 5.5
@onready var rb = $"../RigidBody3D"

func _process(_delta: float) -> void :
	#transform.origin.z=transform.origin.z+0.2
	#if transform.origin.z>10 :
	#	transform.origin.y=transform.origin.y+0.2

	pass

func _moove(delta) :
	pass
	#var input_direction = Input.get_vector("move_left","move_right","move_forward","move_back")
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			rb.apply_impulse(transform.basis.z*5)
		if event.pressed and event.keycode == KEY_LEFT:
			rb.apply_torque_impulse(transform.basis.y/20)
		if event.pressed and event.keycode == KEY_RIGHT:
			rb.apply_torque_impulse(-transform.basis.y/20)
		if event.pressed and event.keycode == KEY_UP:
			rb.apply_torque_impulse(-transform.basis.x/20)
		if event.pressed and event.keycode == KEY_DOWN:
			rb.apply_torque_impulse(transform.basis.x/20)
	#print(rb.angular_velocity)
	
 
