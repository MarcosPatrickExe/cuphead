extends Node2D;
var count :float = 0;
var modifyIncrement :int= 1;


func _process(delta):
	var tower = self.get_node("ocean_tower_sprite");
	count += (delta * modifyIncrement) ;
	
	if((count >= 0.450789)):
		modifyIncrement *= -1;
	if((count <= -0.450789)):
		modifyIncrement *= -1;
		
	# print("count: ",count);
	tower.rotate( deg2rad(count) );
