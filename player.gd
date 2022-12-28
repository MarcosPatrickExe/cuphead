extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const speedConstant :int = 1;
const ATRITO :int = 3;
const ACELERACAO :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
enum Directions { RIGHT, DOWN, LEFT, UP }
var currentDirection = Directions.RIGHT;



func _ready():
	print("helloo from ready");
	# self.get_child(0).frame = 0;


func _physics_process(delta :float) -> void:
	# Input.get_action_strength("a") # retorna o valor 1 caso a tecla seja pressionada e 0, caso não
	# var eixo.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	# var eixo.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	# eixo.normalized();
	
	
	var speedResult = Vector2.ZERO;
	
	if (Input.is_action_pressed("ui_right") || Input.is_action_pressed("d")):
			speedResult.x = speedConstant;
			self.currentDirection = Directions.RIGHT;
			playerAnimationInstance.play("Run_to_right");
	#		print(self.get_children()[0].scale);

	elif (Input.is_action_pressed("ui_left") || Input.is_action_pressed("a")):
			speedResult.x = -speedConstant;
			self.currentDirection = Directions.LEFT;
			playerAnimationInstance.play("Run_to_left");
	else:	
			speedResult.x = 0;
		#	playerAnimationInstance.stop();
	
			
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("w")):
			speedResult.y = -speedConstant;
			self.currentDirection = Directions.UP;
			playerAnimationInstance.play("Run_to_top");
			
	elif (Input.is_action_pressed("ui_down") || Input.is_action_pressed("s")):
			speedResult.y = speedConstant;
			self.currentDirection = Directions.DOWN;
			playerAnimationInstance.play("Run_to_down");
	else:
			speedResult.y = 0;
		#	playerAnimationInstance.stop();
			
			
			
#	speedResult.normalized();

 
	if (speedResult != Vector2.ZERO):
		# playerSpeed = speedResult;
		playerSpeed = playerSpeed.move_toward(speedResult, ACELERACAO * delta);
	else:
		playerAnimationInstance.stop();
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, ATRITO * delta);
			# caso nada seja pressionado, o vetor 'playerSpeed' terá seus valorex X e Y 
			# subtraídos pela expressao "ATRITO * delta" até chegarem à zero, como definido
			# em "Vector2.ZERO"



	if(playerSpeed == Vector2.ZERO): #Caso o player esteja parado, ele recebe um frame estatico
		
		match self.currentDirection: #"match" atua como um 'switch' 
			Directions.LEFT:
				self.get_child(0).frame = 12;
			Directions.UP:
				self.get_child(0).frame = 9;
			Directions.RIGHT:
				self.get_child(0).frame = 0;
			Directions.DOWN:
				self.get_child(0).frame = 21;
		
		
		
		

	#	print("speedX: ", str(speedResult.x));
	#	print("speedY: ", str(speedResult.y));
	#	print("ATRITO * delta: ", str((ATRITO * delta)));
	#	print("ACELERACAO * delta: ", str((ACELERACAO * delta)));
	#	print("delta: ", str(delta));
	
	
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:

