extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED_MAX :int = 2;
const FRICTION :int = 15;
const ACCELERATION :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
enum Directions { RIGHT, DOWN, LEFT, UP }
var currentDirection = Directions.DOWN;



func _physics_process(delta :float) -> void:
	
	var directionResult = Vector2.ZERO;
	
	directionResult.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	directionResult.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	#directionResult = directionResult.normalized();
	print("X: ",str(directionResult.x),"// Y: ",str(directionResult.y));
	
	
	if((directionResult.x!=0) && (directionResult.y!=0)):
		directionResult = Vector2.ZERO;
		playerSpeed = Vector2.ZERO;
		
	elif (directionResult != Vector2.ZERO):
		self.playAnimations(directionResult.x, directionResult.y);
		# playerSpeed = directionResult;
		playerSpeed = playerSpeed.move_toward(directionResult *3, self.ACCELERATION * delta);
	
	else:
		playerAnimationInstance.stop();
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
			# caso nada seja pressionado, o vetor 'playerSpeed' terá seus valorex X e Y 
			# subtraídos pela expressao "ATRITO * delta" até chegarem à zero, como definido
			# em "Vector2.ZERO"
		
		#Caso o player esteja parado, ele recebe um frame estatico
		if(playerSpeed == Vector2.ZERO): 
			
			match self.currentDirection: #"match" atua como um 'switch' 
				Directions.LEFT:
					self.get_child(0).frame = 3;
				Directions.UP:
					self.get_child(2).frame = 3;
				Directions.RIGHT:
					self.get_child(1).frame = 3;
				Directions.DOWN:
					self.get_child(3).frame = 4;


	

	
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	self.move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
	
	
	
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
		
	# deixando o node Sprite visivel correspondente com a direcao que o personagem esta olhando
	for count in 4:
		if count == direction:
			self.get_child(count).visible = true;
		else:
			self.get_child(count).visible = false;

