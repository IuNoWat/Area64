extends Camera3D



@onready var Ship = $"../RigidBody3D"

func _ready()->void :
	pass

func _process(_delta: float) -> void :
	#if transform.origin!=Ship.transform.origin+Ship.transform.basis.z*-30 :
	transform.origin=Ship.transform.origin+Ship.transform.basis.z*-30+Ship.transform.basis.y*7

	#if transform!=transform.looking_at(Ship.transform.origin+Ship.transform.basis.y*15,Ship.transform.basis.y):
	#	diff=transform-transform.looking_at(Ship.transform.origin+Ship.transform.basis.y*15,Ship.transform.basis.y)
	#	transform
	
	transform=transform.looking_at(Ship.transform.origin+Ship.transform.basis.y*15,Ship.transform.basis.y)
	
	#if transform.origin.y!=Ship.transform.origin.y+8 :
	#	transform.origin.y+=(Ship.transform.origin.y+8-transform.origin.y)/20
	#if transform.origin.z!=Ship.transform.origin.z-20 :
	#	transform.origin.z+=(Ship.transform.origin.z-20-transform.origin.z)/20
	#if transform.origin.x!=Ship.transform.origin.x :
	#	transform.origin.x+=(Ship.transform.origin.x-transform.origin.x)/20
	#transform.origin.y=Ship.transform.origin.y+8
	#transform.origin.z=Ship.transform.origin.z-20
	#transform.origin.x=Ship.transform.origin.x

	
	
