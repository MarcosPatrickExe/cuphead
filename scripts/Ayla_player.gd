extends StaticBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;


func _ready() -> void:
	self.currentDirection = Directions.DOWN;



func _physics_process(delta :float) -> void:
	
	if(Input.is_action_just_pressed("a")):
		self.currentDirection = Directions.LEFT;
		
	elif(Input.is_action_just_pressed("w")):
		self.currentDirection = Directions.UP;
		
	elif(Input.is_action_just_pressed("d")):
		self.currentDirection = Directions.RIGHT;
		
	elif(Input.is_action_just_pressed("s")):
		self.currentDirection = Directions.DOWN;
	
	
	
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
	
	
	
	
