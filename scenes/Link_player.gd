extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED_MAX :int = 2;
const FRICTION :int = 3;
const ACCELERATION :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
enum Directions { RIGHT, DOWN, LEFT, UP }
var currentDirection;



func _physics_process(delta :float) -> void:
	
	var directionResult = Vector2.ZERO;
	
	directionResult.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	directionResult.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	directionResult = directionResult.normalized();
			
			
	if (directionResult != Vector2.ZERO):
		playAnimations(directionResult.x, directionResult.y);
		# playerSpeed = directionResult;
		playerSpeed = playerSpeed.move_toward(directionResult, self.ACCELERATION * delta);
	else:
		playerAnimationInstance.stop();
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
			# caso nada seja pressionado, o vetor 'playerSpeed' terá seus valorex X e Y 
			# subtraídos pela expressao "ATRITO * delta" até chegarem à zero, como definido
			# em "Vector2.ZERO"
			


	if(playerSpeed == Vector2.ZERO): #Caso o player esteja parado, ele recebe um frame estatico
		
		match self.currentDirection: #"match" atua como um 'switch' 
			Directions.LEFT:
				self.get_child(0).frame = 3;
			Directions.UP:
				self.get_child(2).frame = 3;
			Directions.RIGHT:
				self.get_child(1).frame = 3;
			Directions.DOWN:
				self.get_child(3).frame = 4;
		
#	print("delta: ", str(delta));
	
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
	
	
	
func playAnimations(X :int, Y :int) -> void:
	var direction =0;
	
	if(X ==1):
		direction = 1;
		self.currentDirection = Directions.RIGHT;
		playerAnimationInstance.play("Run_to_right");
		
	elif(X == -1):
		direction = 0;
		playerAnimationInstance.play("Run_to_left");
		self.currentDirection = Directions.LEFT;
		
	elif(Y ==1):
		direction = 3;
		playerAnimationInstance.play("Run_to_down");
		self.currentDirection = Directions.DOWN;
		
	elif(Y == -1):
		direction = 2;
		playerAnimationInstance.play("Run_to_top");
		self.currentDirection = Directions.UP;
		
	for cont in 4:
		if cont == direction:
			self.get_child(cont).visible = true;
		else:
			self.get_child(cont).visible = false;

