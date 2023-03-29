extends KinematicBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;
var playerCood = Vector2(0, 0);
var directionValues = Vector2(0, 0);


func _ready():
	self.currentDirection = Directions.RIGHT;
	
	
func _physics_process(delta:float) -> void:
	
	self.directionValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	self.playerCood = playerCood.move_toward(directionValues*3, delta*10.0);

	if(directionValues != Vector2.ZERO):
		pass
	else:
		self.idleAnimations(directionValues.x, directionValues.y);
		

	self.move_and_collide(playerCood);
	
	
	
	
func idleAnimations(x:int, y:int):
	
	match x:
		-1: self.currentDirection = Directions.LEFT;
		1: self.currentDirection = Directions.RIGHT;
	match y:
		-1: self.currentDirection = Directions.UP;
		1: self.currentDirection = Directions.DOWN;


	for count in range(0, 3):
		self.get_child(count).visible = false;
	
	match self.currentDirection:
		Directions.UP:
			$Sora_stopped_up.visible = true;
		Directions.DOWN:
			$Sora_stopped_down.visible = true;
		Directions.LEFT:
			$Sora_stopped.set_flip_h(false);
			$Sora_stopped.visible = true;
		Directions.RIGHT:
			$Sora_stopped.set_flip_h(true);
			$Sora_stopped.visible = true;
		
	
	
func runAnimations(X: int, Y: int):
	
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
	
	
