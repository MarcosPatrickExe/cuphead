extends KinematicBody2D

var playerSpeed :Vector2 = Vector2(0, 0); # Vector2.ZERO;
const SPEED_MAX :int = 3;
const FRICTION :int = 3;
const ACCELERATION :int = 10;
onready var playerAnimationInstance = $AnimationPlayer; #Instancia o node dentro da funcao "ready()"
onready var animationTree = $AnimationTree;
onready var animationState = animationTree.get("parameters/playback");
var directionResult = Vector2.ZERO;
var count :float = 0.0;



func _physics_process(delta :float) -> void:
	
	count += self.ACCELERATION * delta;
	#print("count: ",str(count));
	
	
	if(count > 15.0):
		directionResult = generatePositionBat();
		count = 0.0;
	
	
	#directionResult = directionResult.normalized();
			
	animationTree.set("parameters/Flying/blend_position", directionResult);
	animationTree.set("parameters/Static/blend_position", directionResult);

	print("X: ",str(directionResult.x), " Y: ",str(directionResult.y));
	 
		
	if (directionResult != Vector2.ZERO):
		playerSpeed = playerSpeed.move_toward(directionResult, self.ACCELERATION * delta);
		animationState.travel("Flying");
	else:
		#if (animationState.is_playing()):
		animationState.travel("Static");
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, self.FRICTION * delta);
	
	
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa



func generatePositionBat() -> Vector2:
	var directionRandom = Vector2.ZERO;
	directionRandom.x = int(rand_range(-2, 2)); #-1 if (int(rand_range(0, 2))==0) else 1
	directionRandom.y = int(rand_range(-2, 2));
	# print("X: ",str(directionRandom.x), " Y: ",str(directionRandom.y));
	
	return directionRandom;
	
