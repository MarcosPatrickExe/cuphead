extends ActionLeaf


enum currentState {
	STATIC_LEFT,
	STATIC_TOP,
	STATIC_RIGHT,
	STATIC_BOTTOM,
}


func tick(agent, saveStore):
	
	print("patrol");
	return FAILURE;
	
