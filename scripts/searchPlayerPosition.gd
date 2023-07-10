extends ActionLeaf



func tick(actor, blackboard):

	var mousePos = actor.enemyBody.get_global_position();		  #get_viewport().get_mouse_position();
	
	blackboard.set("playerPosition", mousePos);
	
	return SUCCESS;
