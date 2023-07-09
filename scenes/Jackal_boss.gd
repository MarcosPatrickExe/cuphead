extends Node2D


enum CurrentState {
	STATIC_LEFT,
	STATIC_TOP,
	STATIC_RIGHT,
	STATIC_DOWN,
	WALK_LEFT,
	WALK_TOP,
	WALK_RIGHT,
	WALK_DOWN,
}

#export (CurrentState) var currentState = CurrentState.WALK_RIGHT;


onready var jackalAnimations = $JackalSprites/AnimationPlayer;
#onready var patrolAction = $"%patrolAction";


func startAnimation(name :String):
	self.jackalAnimations.play(name);
