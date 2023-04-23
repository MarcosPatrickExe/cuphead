extends KinematicBody2D;
var directionsValues :Vector2 = Vector2.ZERO;
enum states { UP, LEFT, RIGHT, DOWN, DEFEATED }
var currentState = states.RIGHT;
var playerValues = Vector2.ZERO;


func _ready():
	pass



func _physics_process(delta: float) -> void:
	
	directionsValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	directionsValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	# impedindo a personagem de andar na diagonal:
	if( (directionsValues.x !=0) && (directionsValues.y!=0)):
		self.directionValues = Vector2.ZERO;
		
	
	# para quando o personagem estiver parado:
	elif( self.playerValues == Vector2.ZERO ):
		match self.currentState:
			states.DOWN:
				$AnimationPlayer.play("idle_down");
			states.UP:
				$AnimationPlayer.play("idle_up");
			states.RIGHT:
				$all_sprites.set_flip_h(false);
				$AnimationPlayer.play("idle_right");
			states.LEFT:
				$all_sprites.set_flip_h(true);
				$AnimationPlayer.play("idle_right");

	
	
	self.playerValues = self.playerValues.move_toward(directionsValues*4, delta*10)
	self.position += playerValues;
	
	
	# animacoes de movimentacao:
	if(directionsValues.x == -1):
		$all_sprites.set_flip_h(true);
		$AnimationPlayer.play("run_to_right");
		self.currentState = states.LEFT;
		
	elif(directionsValues.x == 1):
		$all_sprites.set_flip_h(false);
		$AnimationPlayer.play("run_to_right");
		self.currentState = states.RIGHT;
		
	elif(directionsValues.y == -1):
		$AnimationPlayer.play("run_to_up");
		self.currentState = states.UP;
		
	elif(directionsValues.y == 1):
		$AnimationPlayer.play("run_to_down");
		self.currentState = states.DOWN;
