extends ConditionLeaf



func tick(actor, blackboard):
	
	if( actor.get_child(0).playerIsCloser ):
#		print("is Player Nearby");
		return SUCCESS;
	else:
#		print("is not Player Nearby");
		actor.get_child(0).jackalMove( Vector2.ZERO ); # mantem o Jackal parado
		return FAILURE;
