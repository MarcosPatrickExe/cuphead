extends ActionLeaf



func tick(actor, blackboard):
	
	#print(blackboard.get("state"),"  orig: ",actor.CurrentState.WALK_LEFT );
	
	print("attacking");
	
	
	var distance_to_target = get_viewport().get_mouse_position() - actor.get_child(0).get_global_position();
	#blackboard.set("distance", distance_to_target);
	actor.distance = distance_to_target;
	
	
	match blackboard.get("state"):
		actor.CurrentState.WALK_LEFT:
			#actor.get_child(0).get_node("Jackal_sprite").set_flip_h(false);
			actor.startAnimation("attack_left");
			
		actor.CurrentState.WALK_TOP:
			actor.startAnimation("attack_top");
			#print("attacking", blackboard.get("delta"));
		
		actor.CurrentState.WALK_DOWN:
			actor.startAnimation("attack_down");
			
		actor.CurrentState.WALK_RIGHT:
			#actor.get_child(0).get_node("Jackal_sprite").set_flip_h(true);
			actor.startAnimation("attack_right");


	return SUCCESS;
