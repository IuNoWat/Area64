extends Camera3D



@onready var Ship = $"../RigidBody3D"
@onready var aim = %aim
var old_origins = []
var look_pos

func update_cam_dir() :
	var pos=aim.global_position
	if len(old_origins)<15 :
		old_origins.append(pos)
	else :
		old_origins.remove_at(0)
		old_origins.append(pos)
	look_pos=old_origins[0]
	for i in range(1,len(old_origins)) :
		look_pos.x+=old_origins[i].x
		look_pos.y+=old_origins[i].y
		look_pos.z+=old_origins[i].z
	look_pos.x=look_pos.x/len(old_origins)
	look_pos.y=look_pos.y/len(old_origins)
	look_pos.z=look_pos.z/len(old_origins)
	return look_pos
	
func _ready()->void :
	pass

func _process(_delta: float) -> void :
 
	
	#On place la camera 30 unité derrière le vaisseau
	position=Ship.position+Ship.transform.basis.z*-30#+Ship.transform.basis.y*7
	
	#On fait monter un peu la caméra le long de son propre axe y pour que le vaisseau soit dans la partie inferieure de l'ecran
	position=position+transform.basis.y*15
	
	#On regarde dans la direction du vaisseau
	#look_at(Ship.position,Ship.transform.basis.y)
	
	#On regarde vers une moyenne de la position du vaisseau
	look_pos=update_cam_dir()
	look_at(look_pos,Ship.transform.basis.y)
	
	#if transform.origin.y!=Ship.transform.origin.y+8 :
	#	transform.origin.y+=(Ship.transform.origin.y+8-transform.origin.y)/20
	#if transform.origin.z!=Ship.transform.origin.z-20 :
	#	transform.origin.z+=(Ship.transform.origin.z-20-transform.origin.z)/20
	#if transform.origin.x!=Ship.transform.origin.x :
	#	transform.origin.x+=(Ship.transform.origin.x-transform.origin.x)/20
	#transform.origin.y=Ship.transform.origin.y+8
	#transform.origin.z=Ship.transform.origin.z-20
	#transform.origin.x=Ship.transform.origin.x

	
	
