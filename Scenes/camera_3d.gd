extends Camera3D



@onready var Ship = $"../RigidBody3D"
var old_origins = []
var look_pos

func update_cam_dir(pos:Vector3) :
	if len(old_origins)<300 :
		old_origins.append(pos)
	else :
		old_origins.remove_at(0)
		old_origins.append(pos)
	look_pos=Vector3(0,0,0)
	for entry in old_origins :
		look_pos.x+=entry.x
		look_pos.y+=entry.y
		look_pos.z+=entry.z
	look_pos.x=look_pos.x/len(old_origins)
	look_pos.y=look_pos.y/len(old_origins)
	look_pos.z=look_pos.z/len(old_origins)
	return pos
	
func _ready()->void :
	pass

func _process(_delta: float) -> void :
	print(transform.origin)
	print(position)
	print(global_rotation)
	#print(Ship.transform.basis.z)
	print("--------------------")
	
	#On place la camera 30 unité derrière le vaisseau
	position=Ship.position+Ship.transform.basis.z*-30#+Ship.transform.basis.y*7
	
	#On fait monter un peu la caméra le long de son propre axe y pour que le vaisseau soit dans la partie inferieure de l'ecran
	#position.y=position.y+20
	
	rotate_z(0.1)
	
	
	
	#On regarde dans la direction du vaisseau
	transform=transform.looking_at(Ship.position)
	
	#On s'assure que le haut du vaisseau et le ahut de la caméra soient toujours pointés dans la même direction
	#global_rotation.y=3.14
	
	#On regarde vers une moyenne de la position du vaisseau
	#look_pos=update_cam_dir(Ship.position)
	#transform=transform.looking_at(look_pos)
	
	#if transform.origin.y!=Ship.transform.origin.y+8 :
	#	transform.origin.y+=(Ship.transform.origin.y+8-transform.origin.y)/20
	#if transform.origin.z!=Ship.transform.origin.z-20 :
	#	transform.origin.z+=(Ship.transform.origin.z-20-transform.origin.z)/20
	#if transform.origin.x!=Ship.transform.origin.x :
	#	transform.origin.x+=(Ship.transform.origin.x-transform.origin.x)/20
	#transform.origin.y=Ship.transform.origin.y+8
	#transform.origin.z=Ship.transform.origin.z-20
	#transform.origin.x=Ship.transform.origin.x

	
	
