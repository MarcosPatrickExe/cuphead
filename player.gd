extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED :int = 2;
const FRICTION :int = 20;
const ACCELERATION :int = 20;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
enum states { IDLE_RIGHT, IDLE_DOWN, IDLE_LEFT, IDLE_UP, LEFT_ATTACK, RIGHT_ATTACK, UP_ATTACK, DOWN_ATTACK }
var currentState;
const attackDurationLimit = 8 ;


#funcao q eh executada quando a animacao de ataque termina, alem de mudar o estado 'ataque' para 'idle':
func onAttackEndingAnimation():
	
	match self.currentState:
		states.LEFT_ATTACK:
			self.currentState = self.states.IDLE_LEFT;
		states.RIGHT_ATTACK:
			self.currentState = self.states.IDLE_RIGHT;
	


func _input(event :InputEvent):
	if(event.is_action_released("arrow_left") ):
		self.currentState = self.states.LEFT_ATTACK;
		playerAnimationInstance.play("left_attack");
		
	if(event.is_action_pressed("arrow_right") ):
		self.currentState = self.states.RIGHT_ATTACK;
		playerAnimationInstance.play("right_attack");



func _ready():
	self.currentState = states.IDLE_DOWN;
	# self.get_node("CollisionShape2D").disabled = true; # only works for main player!!
	# OS.set_window_maximized(true);



func _physics_process(delta :float) -> void:
	
	var speedResult = Vector2.ZERO;
	
	if (Input.is_action_pressed("d")):
			speedResult.x = SPEED;
			self.currentState = states.IDLE_RIGHT;
			playerAnimationInstance.play("Run_to_right");
	#		print(self.get_children()[0].scale);

	elif (Input.is_action_pressed("a")):
			speedResult.x = -SPEED;
			self.currentState = states.IDLE_LEFT;
			playerAnimationInstance.play("Run_to_left");
	else:	
			speedResult.x = 0;
	
			
	if (Input.is_action_pressed("w")):
			speedResult.y = -SPEED;
			self.currentState = states.IDLE_UP;
			playerAnimationInstance.play("Run_to_top");
			
			
	elif (Input.is_action_pressed("s")):
			speedResult.y = SPEED;
			self.currentState = states.IDLE_DOWN;
			playerAnimationInstance.play("Run_to_down");
	else:
			speedResult.y = 0;

 

	if (speedResult != Vector2.ZERO):
		# playerSpeed = speedResult;
		playerSpeed = playerSpeed.move_toward(speedResult, self.ACCELERATION * delta);
	else:
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
			# caso nada seja pressionado, o vetor 'playerSpeed' terá seus valorex X e Y 
			# subtraídos pela expressao "ATRITO * delta" até chegarem à zero, como definido
			# em "Vector2.ZERO"


	if((playerSpeed == Vector2.ZERO) and (self.currentState != states.RIGHT_ATTACK) and (self.currentState != states.LEFT_ATTACK)  ): #Caso o player esteja parado, ele recebe um frame estatico
		playerAnimationInstance.stop();
		
		match self.currentState: #"match" atua como um 'switch' 
			states.IDLE_LEFT:
				 self.get_child(0).frame = 12;
			#	playerAnimationInstance.play("attack_left");
			states.IDLE_UP:
				self.get_child(0).frame = 9;
			states.IDLE_RIGHT:
				self.get_child(0).frame = 0;
			states.IDLE_DOWN:
				self.get_child(0).frame = 21;

	
	#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
