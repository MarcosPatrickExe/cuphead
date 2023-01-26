extends Node2D;
var count :float = 0;
var modifyIncrement :int= 1;


func _process(delta):
	var tower = self.get_node("OceanTower");
	count += (delta * modifyIncrement) ;
	
	if((count >= 0.5)):
		modifyIncrement *= -1;
	if((count <= -0.5)):
		modifyIncrement *= -1;
		
	print("count: ",count);
	
	tower.rotate( deg2rad(count) );
	# print("count: ",count);
