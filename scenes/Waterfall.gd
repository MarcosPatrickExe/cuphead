extends Node2D;

var water_speed: float;


func _process(delta):
	
	water_speed +=delta;
	
	if(water_speed > 0.3):
		for n in range(11, 71):
			var nodeName = "PokemonExteriorTileset"+str(n);
			var tile = self.get_node(nodeName);
			tile.set_position( Vector2(tile.position.x, tile.position.y+8) );
			
			if(tile.position.y >= 110):
				tile.set_position( Vector2(tile.position.x, 14.75) );
			
			# print("position: ",tile.position.y);
			# tile1.position(tile1.get_position_in_parent());
			water_speed = 0;
	
