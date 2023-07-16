extends ActionLeaf



func tick(actor, blackboard):

	var playerPos = actor.enemyBody.get_global_position(); #get_viewport().get_mouse_position();
	
	blackboard.set("playerPosition", playerPos);
	
	return SUCCESS;
