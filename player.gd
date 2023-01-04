extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED :int = 1;
const FRICTION :int = 6;
const ACCELERATION :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
enum Directions { RIGHT, DOWN, LEFT, UP }
var currentDirection = Directions.RIGHT;



func _ready():
	print("helloo from ready");
	# self.get_child(0).frame = 0;
	# self.get_node("CollisionShape2D").disabled = true; # only works for main player!!


func _physics_process(delta :float) -> void:
	# Input.get_action_strength("a") # retorna o valor 1 caso a tecla seja pressionada e 0, caso não
	# var eixo.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	# var eixo.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	# eixo.normalized();
	
	
	var speedResult = Vector2.ZERO;
	
	if (Input.is_action_pressed("d")):
			speedResult.x = SPEED;
			self.currentDirection = Directions.RIGHT;
			playerAnimationInstance.play("Run_to_right");
	#		print(self.get_children()[0].scale);

	elif (Input.is_action_pressed("a")):
			speedResult.x = -SPEED;
			self.currentDirection = Directions.LEFT;
			playerAnimationInstance.play("Run_to_left");
	else:	
			speedResult.x = 0;
	
			
	if (Input.is_action_pressed("w")):
			speedResult.y = -SPEED;
			self.currentDirection = Directions.UP;
			playerAnimationInstance.play("Run_to_top");
			
	elif (Input.is_action_pressed("s")):
			speedResult.y = SPEED;
			self.currentDirection = Directions.DOWN;
			playerAnimationInstance.play("Run_to_down");
	else:
			speedResult.y = 0;

 
	if (speedResult != Vector2.ZERO):
		# playerSpeed = speedResult;
		playerSpeed = playerSpeed.move_toward(speedResult, self.ACCELERATION * delta);
	else:
		playerAnimationInstance.stop();
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
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
		
		
	#   print("ACELERACAO * delta: ", str((ACELERACAO * delta)));
	#	print("delta: ", str(delta));
	

	#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
