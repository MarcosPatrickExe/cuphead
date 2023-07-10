extends ConditionLeaf



func tick(actor, blackboard):
	
	
	if( actor.distance.length() <= 70 ):
		actor.get_child(0).jackalMove( Vector2.ZERO );
		
		return SUCCESS
	else:
		return FAILURE




#if( blackboard.get("distance").length() <= 70 ):
