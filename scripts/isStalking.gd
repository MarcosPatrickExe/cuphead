extends ConditionLeaf



func tick(actor, blackboard):
	print("length: ",actor.distance.length())
	
	if( actor.get_child(0).playerIsCloser and (actor.distance.length() > 70.0)  ): #and actor.isAttacking==false
		return SUCCESS;
	else:
		return FAILURE;
