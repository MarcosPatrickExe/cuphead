extends KinematicBody2D

var playerSpeed = Vector2(0, 0) # Vector2.ZERO;
const speedConstant = 1;
const ATRITO = 15;
const ACELERACAO = 10;


var controll = {
	'up': false,
	'down': false,
	'right': false,
	'left': false
}


func _physics_process(delta):
	# Input.get_action_strength("a") # retorna o valor 1 caso a tecla seja pressionada e 0, caso não
	# var eixo.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	# var eixo.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	# eixo.normalized();
	self.controll['up'] = true;
	
	var speedResult = Vector2.ZERO;
	
	if (Input.is_action_pressed("ui_right") || Input.is_action_pressed("d")):
			speedResult.x = speedConstant;
	#		print(self.get_children()[0].scale);

	elif (Input.is_action_pressed("ui_left") || Input.is_action_pressed("a")):
			speedResult.x = -speedConstant;
	else:
			speedResult.x = 0;
	
			
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("w")):
			speedResult.y = -speedConstant;
	elif (Input.is_action_pressed("ui_down") || Input.is_action_pressed("s")):
			speedResult.y = speedConstant;
	else:
			speedResult.y = 0;
			
	speedResult.normalized();


	if (speedResult != Vector2.ZERO):
		# playerSpeed = speedResult;
		playerSpeed = playerSpeed.move_toward(speedResult, ACELERACAO * delta);
	else:
		playerSpeed = playerSpeed.move_toward(Vector2.ZERO, ATRITO * delta);
			# caso nada seja pressionado, o vetor 'playerSpeed' terá seus valorex X e Y 
			# subtraídos pela expressao "ATRITO * delta" até chegarem à zero, como definido
			# em "Vector2.ZERO"

	#	print("speedX: ", str(speedResult.x));
	#	print("speedY: ", str(speedResult.y));
	#	print("ATRITO * delta: ", str((ATRITO * delta)));
	#	print("ACELERACAO * delta: ", str((ACELERACAO * delta)));
	#	print("delta: ", str(delta));
	
	
	move_and_collide(playerSpeed);  # aplicando os valores de 'playerSpeed' para a funcao acumulativa
#	self.position = self.position + playerSpeed;   TBM EQUIVALE À:

