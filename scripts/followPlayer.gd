extends ActionLeaf

const MAX_VELOCITY = 1.5;
const MAX_FORCE = 1.0;
var current_velocity = Vector2.ZERO;


func tick(actor, blackboard):
	
	var distance_to_target = blackboard.get("mousePosition") - actor.get_child(0).get_global_position();
	var desired_velocity = distance_to_target.normalized() * self.MAX_VELOCITY; #converte a distancia para valores entre -0.999 ate 0.999
	
	blackboard.set("distance", distance_to_target);
	
	var steeringForce = (desired_velocity - self.current_velocity) / blackboard.get("delta");
	steeringForce = steeringForce.clamped(self.MAX_FORCE);
	
	self.current_velocity = steeringForce;
	
	
	# MOVENDO O BOSS 'JACKAL'
	actor.get_child(0).jackalMove( steeringForce ); #, blackboard.get("delta")


	# DEFININDO A DIRECAO DO JACKAL BASEADO NA POSICAO DO MOUSE: 
	var posi = get_viewport().get_mouse_position();
	var newAngle = rad2deg( actor.get_child(0).position.angle_to_point( posi) ); #print( rad2deg( posi.angle_to_point( actor.get_child(0).position ) ) );
	
	if ( newAngle > 45 and newAngle < 135 ):
		blackboard.set("state", actor.CurrentState.WALK_TOP )
		actor.startAnimation("walk_to_up");
		
	elif ( newAngle < 45 and newAngle > -45 ):
		blackboard.set("state", actor.CurrentState.WALK_LEFT )
		actor.startAnimation("walk_to_left");
		
	elif ( newAngle < -45 and newAngle > -135 ):
		blackboard.set("state", actor.CurrentState.WALK_DOWN );
		actor.startAnimation("walk_to_down");
		
	elif ( newAngle < -135 or newAngle > 135 ):
		blackboard.set("state", actor.CurrentState.WALK_RIGHT );
		actor.startAnimation("walk_to_right");
	#===========================================================
	
	
	return SUCCESS;
