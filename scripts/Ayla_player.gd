extends KinematicBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;
var playerCood = Vector2(0, 0);
var directionValues = Vector2(0, 0);




func _ready() -> void:
	self.currentDirection = Directions.DOWN;



func _physics_process(delta :float) -> void:
	
	self.directionValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
		# self.currentDirection = Directions.LEFT;

	if(playerCood != Vector2.ZERO):
		self.animations(directionValues.x, directionValues.y);
	else:
		self.idleAnimations();
	
	playerCood = playerCood.move_toward(self.directionValues*6, delta*20); # aqui a velocidade do player vai aumentando (ou diminuindo) ate chegar no valor-alvo, delimitado por "directionValues*6" !!
	# playerCood = directionValues*6; # nessa versao, a velocidade do player eh constante!!
	#playerCood.x += directionValues.x;  # aqui a velocidade do player eh acelerada ate o infinito, sem nenhum limite!!
	

	self.move_and_collide(playerCood);
	
	
	
	
	
	
func idleAnimations():
	
	# ocultando sprites do personagem quando esta correndo:
	for count in range(0, 4):
		self.get_child(count).visible = false;
	
	
	match self.currentDirection:
		Directions.DOWN:
			self.get_node("Ayla_stopped_down").visible = true;
			self.animations.play("stopped_down");
			
		Directions.UP:
			self.get_node("Ayla_stopped_up").visible = true;
			self.animations.play("stopped_up");
			
		Directions.RIGHT:
			self.get_node("Ayla_stopped").set_flip_h(false);
			self.get_node("Ayla_stopped").visible = true;
		Directions.LEFT:
			self.get_node("Ayla_stopped").set_flip_h(true);
			self.get_node("Ayla_stopped").visible = true;
	
	
	
func animations( X :int, Y:int) -> void:
	
	# ocultando sprites do personagem quando esta parado:
	self.get_node("Ayla_stopped_down").visible = false;
	self.get_node("Ayla_stopped_up").visible = false;
	self.get_node("Ayla_stopped").visible = false;
	
	
	match X:
		-1:
			self.animations.play("run_to_left");
			self.dirCod = 1;
			self.currentDirection = self.Directions.LEFT;
		1:
			self.animations.play("run_to_right");
			self.dirCod = 2;
			self.currentDirection = self.Directions.RIGHT;
	match Y:
		1:
			self.currentDirection = self.Directions.DOWN;
			self.animations.play("run_to_down");
			self.dirCod = 3;
		-1:
			self.currentDirection = self.Directions.UP;
			self.animations.play("run_to_up");
			self.dirCod = 0;
	
	
	for count in range(0, 4):
		if(count == self.dirCod):
			self.get_child(count).visible = true;
		else:
			self.get_child(count).visible = false;
			
			
	
	
	
	
	
