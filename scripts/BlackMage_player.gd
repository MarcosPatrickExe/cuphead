extends KinematicBody2D
enum states { UP, LEFT, RIGHT, DOWN  }
var currentState = states.DOWN;
var directionsValues = Vector2(0, 0);
var playerSpeed = Vector2(0, 0);


func _ready():
	pass;



func _physics_process(delta :float) -> void:
	
	self.directionsValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionsValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	print("X: ", str(directionsValues.x), "//  Y: ",str(directionsValues.y));
	
	self.playerSpeed = playerSpeed.move_toward( directionsValues*2, delta*10 );
	
	self.position += self.playerSpeed;


	if(directionsValues.x == -1):
			$AnimationPlayer.play("run_to_left");
	if(directionsValues.x == 1):
			$AnimationPlayer.play("run_to_right");
	if(directionsValues.y == -1):
		$AnimationPlayer.play("run_to_up");
	if(directionsValues.y == 1):
			$AnimationPlayer.play("run_to_down");
