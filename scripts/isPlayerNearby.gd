extends ConditionLeaf



func tick(actor, blackboard):
	#blackboard.set("distance", Vector2(200, 200)); 
	
	
	if( actor.get_child(0).playerIsCloser  ):
		return SUCCESS;
	else:
		actor.get_child(0).jackalMove( Vector2.ZERO );  # mantem o Jackal parado
		return FAILURE;
