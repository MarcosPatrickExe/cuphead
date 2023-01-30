extends Node2D;

var count: float =0;


func _process(delta):
	
	count +=delta;
	
	if(count > 1):
		for n in range(11, 71):
			var nodeName = "PokemonExteriorTileset"+str(n);
			var tile = self.get_node(nodeName);
			tile.set_position( Vector2(tile.position.x, tile.position.y+8.75) );
			
			
			if(tile.position.y > 95):
				tile.set_position( Vector2(tile.position.x, 8) );
			
			# print("position: ",tile.position.y);
			# tile1.position(tile1.get_position_in_parent());
			count = 0;
	
