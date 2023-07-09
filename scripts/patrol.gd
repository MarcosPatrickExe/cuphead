extends ActionLeaf


var actionDuration :float = 0;


func tick(actor, blackboard):
	
	self.actionDuration += blackboard.get("delta");
	
	
	if( blackboard.get("state") == null ):
		blackboard.set("state", actor.CurrentState.STATIC_LEFT );
	
	
	if(self.actionDuration > 2.0):
		self.actionDuration = 0;
		var newStatee = self.randomState(actor);
		blackboard.set("state", newStatee);
		#print("new state: ", blackboard.get("state"));


	match (blackboard.get("state")):
		actor.CurrentState.STATIC_LEFT:
			actor.startAnimation("static_left");
			
		actor.CurrentState.STATIC_TOP:
			actor.startAnimation("static_up");
			
		actor.CurrentState.STATIC_RIGHT:
			actor.startAnimation("static_right");
			
		actor.CurrentState.STATIC_DOWN:
			actor.startAnimation("static_down");
			
		actor.CurrentState.WALK_LEFT:
			actor.startAnimation("walk_to_left");
			
		actor.CurrentState.WALK_TOP:
			actor.startAnimation("walk_to_up");
			
		actor.CurrentState.WALK_RIGHT:
			actor.startAnimation("walk_to_right");
			
		actor.CurrentState.WALK_DOWN:
			actor.startAnimation("walk_to_down");
		
	return SUCCESS;



	
func randomState(actor):
	var random = RandomNumberGenerator.new()
	random.randomize();
	var numberSort = random.randi_range(0, 3);

	match numberSort:
		0: return actor.CurrentState.STATIC_LEFT;
		1: return actor.CurrentState.STATIC_TOP;
		2: return actor.CurrentState.STATIC_RIGHT;
		3: return actor.CurrentState.STATIC_DOWN;
		4: return actor.CurrentState.WALK_LEFT;
		5: return actor.CurrentState.WALK_TOP;
		6: return actor.CurrentState.WALK_RIGHT;
		7: return actor.CurrentState.WALK_DOWN;
		#print("state selected: ", int(actor.CurrentState.keys()[ int(random.randf_range(-1, 8)) ]) );
		#return int( actor.CurrentState.keys()[ random.randi_range(0, 7) ]);
		#return actor.CurrentState.keys()[ randi() % actor.CurrentState.size() ]
		#return actor.CurrentState.keys()[ numberSort];



func randomPosition() -> Vector2:
	var directionRandom = Vector2.ZERO;
	directionRandom.x = int(rand_range(-2, 2)); #-1 if (int(rand_range(0, 2))==0) else 1
	directionRandom.y = int(rand_range(-2, 2));
	return directionRandom;
