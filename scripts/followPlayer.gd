extends ActionLeaf



func tick(actor, blackboard):
	
	var distance_to_target = blackboard.get("mousePosition") - actor.get_child(0).get_global_position();
	var desired_velocity = distance_to_target.normalized(); #converte a distancia para valores entre -0.999 ate 0.999
	
	#print("Distance: ", desired_velocity);
	
	actor.get_child(0).jackalMove( desired_velocity ); #, blackboard.get("delta")


	return SUCCESS;
	
	
	
