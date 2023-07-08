extends ConditionLeaf



func tick(actor, blackboard):
	return FAILURE;
	
	if( actor.get_child(0).playerIsCloser ):
		return SUCCESS;
	else:
		return FAILURE;
