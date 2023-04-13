extends KinematicBody2D;
var directionsValues :Vector2 = Vector2.ZERO;
enum states { UP, LEFT, RIGHT, DOWN, DEFEATED }
var currentState = states.RIGHT;


func _ready():
	pass



func _physics_process(delta: float) -> void:
	
	directionsValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	directionsValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	

	self.position += directionsValues;
	
	
	# animacoes de movimentacao:
	if(directionsValues.x == -1):
			$all_sprites.set_flip_h(true);
			$AnimationPlayer.play("run_to_right");
			self.currentState = states.LEFT;
	elif(directionsValues.x == 1):
			$all_sprites.set_flip_h(false);
			$AnimationPlayer.play("run_to_right");
			self.currentState = states.RIGHT;
	elif(directionsValues.y == -1):
			$AnimationPlayer.play("run_to_up");
			self.currentState = states.UP;
	elif(directionsValues.y == 1):
			$AnimationPlayer.play("run_to_down");
			self.currentState = states.DOWN;
