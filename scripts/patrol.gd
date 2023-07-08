extends ActionLeaf


var actionDuration :float = 0;



func tick(actor, blackboard):
	
	self.actionDuration += blackboard.get("delta");
	
	
	if(self.actionDuration > 5.0):
		self.actionDuration = 0;
		actor.currentState = self.randomState(actor);
		print("currentState: ",actor.currentState);
	#	print("number of childs: ", actor.jackalBossScript.get_children());
	
	var animantion = actor.jackalBossScript;
		
	match actor.currentState:
		actor.CurrentState.STATIC_LEFT:
			animantion.get_node("AnimationPlayer").play("static_left");
			
		actor.CurrentState.STATIC_TOP:
			animantion.get_node("AnimationPlayer").play("static_up");
			
		actor.CurrentState.STATIC_RIGHT:
			animantion.get_node("AnimationPlayer").play("static_right");
			
		actor.CurrentState.STATIC_DOWN:
			animantion.get_node("AnimationPlayer").play("static_down");
			
		actor.CurrentState.WALK_LEFT:
			animantion.get_node("AnimationPlayer").play("walk_to_left");
			
		actor.CurrentState.WALK_TOP:
			animantion.get_node("AnimationPlayer").play("walk_to_up");
			
		actor.CurrentState.WALK_RIGHT:
			animantion.get_node("AnimationPlayer").play("walk_to_right");
			
		actor.CurrentState.WALK_DOWN:
			animantion.get_node("AnimationPlayer").play("walk_to_down");
		
		
	return SUCCESS;



	
func randomState(actor :Node2D):
	var newState = int(rand_range(-1, 8));
	print("state selected: "+actor.CurrentState.keys()[newState] );
	return actor.CurrentState.keys()[newState];
	

func randomPosition() -> Vector2:
	var directionRandom = Vector2.ZERO;
	directionRandom.x = int(rand_range(-2, 2)); #-1 if (int(rand_range(0, 2))==0) else 1
	directionRandom.y = int(rand_range(-2, 2));
	return directionRandom;
