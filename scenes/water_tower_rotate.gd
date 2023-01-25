extends Node2D

var count :float = 0.0;
var modifyIncrement :int= 1;

func _process(delta):
	var tower = self.get_node("OceanTower");
	count += delta #* modifyIncrement ;
	
	if((count > 4.5) or (count < -4.5)):
		#modifyIncrement *= -1;
		print("delta: ",delta);
	
	tower.rotate( deg2rad(count) );
	
	print("count: ",count);
