extends KinematicBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;
var playerCood = Vector2(0, 0);
var directionValues = Vector2(0, 0);
export var ACCELERATION = 4;
var actionsNode :Dictionary = {};


func _ready() -> void:
	self.currentDirection = Directions.DOWN;


func _physics_process(delta :float) -> void:
	
	self.directionValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	# impedindo a personagem de andar na diagonal:
	if( (directionValues.x !=0) && (directionValues.y!=0)):
		self.directionValues = Vector2.ZERO;


	if(directionValues != Vector2.ZERO):
		self.runAnimations(directionValues.x, directionValues.y);
	else:
		self.idleAnimations();
	
	playerCood = playerCood.move_toward(self.directionValues*6, delta*ACCELERATION); # aqui a velocidade do player vai aumentando (ou diminuindo) ate chegar no valor-alvo, delimitado por "directionValues*6" !!
	# playerCood = directionValues*6; # nessa versao, a velocidade do player eh constante, ou seja, vale "directionValues*6" !
	# playerCood.x += directionValues.x;  # aqui a velocidade do player eh acelerada ate o infinito, sem nenhum limite!!
	
	# aqui o "playerCood" eh adicionando a posicao (X, Y) anterior do persoangem
	self.move_and_collide(playerCood);
	
	#print( self.Directions.keys()[self.currentDirection] );
	#print(self.currentDirection);




func idleAnimations() -> void:
	
	# ocultando sprites do personagem quando esta correndo:
	for count in range(0, 4):
		self.get_child(count).visible = false;


	match self.currentDirection:
		Directions.DOWN:
			self.get_node("Ayla_stopped_down").visible = true;
			self.animations.play("stopped_down");
			print("idle down");

		Directions.UP:
			self.get_node("Ayla_stopped_up").visible = true;
			self.animations.play("stopped_up");
			print("idle up");
			
		Directions.RIGHT:
			self.get_node("Ayla_stopped").set_flip_h(false);
			self.get_node("Ayla_stopped").visible = true;
			self.animations.play("stopped_left_right");
			print("idle right");

		Directions.LEFT:
			self.get_node("Ayla_stopped").set_flip_h(true);
			self.get_node("Ayla_stopped").visible = true;
			self.animations.play("stopped_left_right");
			print("idle left");



func runAnimations(x :int, y :int) -> void:
	
	for count in range(4, 7):
		get_child(count).visible = false;

	print(x, "//  ", y);

	match x:
		-1:
			animations.play("run_to_left");
			self.currentDirection = self.Directions.LEFT;
			get_child(1).visible = true;
		1:
			animations.play("run_to_right");
			self.currentDirection = self.Directions.RIGHT;
			get_node("Ayla_run_to_right_sprite").visible = true;
	match y:
		1:
			animations.play("run_to_down");
			self.currentDirection = self.Directions.DOWN;
			get_child(3).visible = true;
		-1:
			animations.play("run_to_up");
			self.currentDirection = self.Directions.UP;
			get_child(0).visible = true;


