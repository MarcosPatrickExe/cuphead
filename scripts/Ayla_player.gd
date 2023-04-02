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
	self.actionsNode = {
		"stopped": $Ayla_stopped,
		"stopped_down": $Ayla_stopped_down,
		"stopped_up": $Ayla_stopped_up
	}


func _physics_process(delta :float) -> void:
	
	self.directionValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	# impedindo a personagem de andar na diagonal:
	if( (directionValues.x !=0) && (directionValues.y!=0)):
		self.directionValues = Vector2.ZERO;


	if(playerCood != Vector2.ZERO):
		Globals.runAnimations(directionValues.x, directionValues.y, self, self.actionsNode );
	else:
		self.idleAnimations();
	
	playerCood = playerCood.move_toward(self.directionValues*6, delta*ACCELERATION); # aqui a velocidade do player vai aumentando (ou diminuindo) ate chegar no valor-alvo, delimitado por "directionValues*6" !!
	# playerCood = directionValues*6; # nessa versao, a velocidade do player eh constante, ou seja, vale "directionValues*6" !
	# playerCood.x += directionValues.x;  # aqui a velocidade do player eh acelerada ate o infinito, sem nenhum limite!!
	
	
	# aqui o "playerCood" eh adicionando a posicao (X, Y) anterior do persoangem
	self.move_and_collide(playerCood);
	
	
	
	
func idleAnimations() -> void:
	
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
