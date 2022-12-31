extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED_MAX :int = 2;
const FRICTION :int = 3;
const ACCELERATION :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
onready var animationTree;
enum Directions { RIGHT, DOWN, LEFT, UP }
var currentDirection;



func _physics_process(delta :float) -> void:
	
	var directionResult = Vector2.ZERO;
	
	directionResult.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	directionResult.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	directionResult = directionResult.normalized();
			
			
	if (directionResult != Vector2.ZERO):

		playerSpeed = playerSpeed.move_toward(directionResult, self.ACCELERATION * delta);
	else:
		
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
	
	
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
