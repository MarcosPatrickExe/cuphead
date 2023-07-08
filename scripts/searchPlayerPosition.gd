extends ActionLeaf

onready var nodevar = Node.new();


func tick(actor, blackboard):
	
	var mousePos = get_viewport().get_mouse_position();
	
	return FAILURE;
