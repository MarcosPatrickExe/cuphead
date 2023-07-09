extends ActionLeaf



func tick(actor, blackboard):
#	print("followPlayerAction");

	print("X Y: ", blackboard.get("mousePosition"));
#	actor.get_child(0).jackalPosition( blackboard.get("mousePosition") ); #, blackboard.get("delta")

	return SUCCESS;
