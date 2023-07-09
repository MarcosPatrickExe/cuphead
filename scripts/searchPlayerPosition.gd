extends ActionLeaf



func tick(actor, blackboard):

	var mousePos = get_viewport().get_mouse_position();
	
	blackboard.set("mousePosition", mousePos);
	
	return SUCCESS;
