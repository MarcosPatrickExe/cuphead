extends KinematicBody2D
enum states { UP, LEFT, RIGHT, DOWN, DEFEATED }
var currentState = states.DOWN;
var directionsValues = Vector2(0, 0);
var playerSpeed = Vector2(0, 0);




func _physics_process(delta :float) -> void:
	
	if(self.currentState == states.DEFEATED):
		return
	
	
	self.directionsValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionsValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	
	# impedindo a personagem de andar na diagonal:
	if( (directionsValues.x !=0) and (directionsValues.y!=0)):
		self.directionsValues = Vector2.ZERO;
	
	
	# animacoes para quando o personagem estiver parado:
	elif( directionsValues == Vector2(0, 0)):
		match self.currentState:
			states.DOWN:
				$AnimationPlayer.play("drinking");
			states.LEFT:
				$AnimationPlayer.play("stopped_left");
			states.RIGHT:
				$AnimationPlayer.play("stopped_right");
				# self.currentState = states.DEFEATED;
			states.UP:
				$AnimationPlayer.play("stopped_up");
			
	
	var mod = 3.5 if(directionsValues.x == 1 or directionsValues.x == -1) else 2;
		
	self.playerSpeed = playerSpeed.move_toward( directionsValues*mod, delta*10 );
	
	# movendo o player
	self.position += self.playerSpeed;


	# animacoes de movimentacao:
	if(directionsValues.x == -1):
			$AnimationPlayer.play("run_to_left");
			self.currentState = states.LEFT;
	elif(directionsValues.x == 1):
			$AnimationPlayer.play("run_to_right");
			self.currentState = states.RIGHT;
	elif(directionsValues.y == -1):
			$AnimationPlayer.play("run_to_up");
			self.currentState = states.UP;
	elif(directionsValues.y == 1):
			$AnimationPlayer.play("run_to_down");
			self.currentState = states.DOWN;
			
