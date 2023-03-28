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
	
	if(Input.is_action_just_pressed("a")):
		self.currentDirection = Directions.LEFT;
		self.directionValues.x = -1;
	elif(Input.is_action_just_pressed("w")):
		self.currentDirection = Directions.UP;
		self.directionValues.y = 1;
	elif(Input.is_action_just_pressed("d")):
		self.currentDirection = Directions.RIGHT;
		self.directionValues.x = 1;
	elif(Input.is_action_just_pressed("s")):
		self.currentDirection = Directions.DOWN;
		self.directionValues.y = -1;
	
	#playerCood = playerCood.move_toward(self.directionValues, delta*10.0);
	#playerCood.x += directionValues.x;  # Exemplo com aceleracao
	#playerCood.y += directionValues.y;  # Exemplo com aceleracao 2
	print("X :",str(playerCood.x));
	
	
	match currentDirection:
		Directions.LEFT:
			self.animations.play("run_to_left");
			self.dirCod = 1;
		Directions.RIGHT:
			self.animations.play("run_to_right");
			self.dirCod = 2;
		Directions.DOWN:
			self.animations.play("run_to_down");
			self.dirCod = 3;
		Directions.UP:
			self.animations.play("run_to_up");
			self.dirCod = 0;
	
	
	for count in range(0, 4):
		if(count == self.dirCod):
			self.get_child(count).visible = true;
		else:
			self.get_child(count).visible = false;
			
			
	self.move_and_collide(playerCood);
	
	
	
	
