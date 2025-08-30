extends Node3D

const SPEED = 5.5
const turning_speed = 0.05

const engine_step = 0.1
var power = 0

@onready var rb = $"../RigidBody3D"

func _process(_delta: float) -> void :
	print(rb.angular_velocity)
	
	rb.apply_impulse(transform.basis.z*power)
	
	pass

func _moove(delta) :
	pass
	#var input_direction = Input.get_vector("move_left","move_right","move_forward","move_back")
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_P:
			power+=engine_step
		if event.pressed and event.keycode == KEY_M:
			power-=engine_step
		if event.pressed and event.keycode == KEY_LEFT:
			rb.apply_torque_impulse(transform.basis.y*turning_speed)
		if event.pressed and event.keycode == KEY_RIGHT:
			rb.apply_torque_impulse(-transform.basis.y*turning_speed)
		if event.pressed and event.keycode == KEY_UP:
			rb.apply_torque_impulse(-transform.basis.x*turning_speed)
		if event.pressed and event.keycode == KEY_DOWN:
			rb.apply_torque_impulse(transform.basis.x*turning_speed)
	#print(rb.angular_velocity)
	
 
