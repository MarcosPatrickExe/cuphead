extends KinematicBody2D

var speed = Vector2.ZERO;
const speedConstant = 3;


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
			speed.x = speedConstant;
			
	elif Input.is_action_pressed("ui_left"):
			speed.x = -speedConstant;
	else:
			speed.x = 0;
	
			
	if Input.is_action_pressed("ui_up"):
			speed.y = -speedConstant;
			
	elif Input.is_action_pressed("ui_down"):
			speed.y = +speedConstant;
	else:
		speed.y = 0;

	move_and_collide(speed);
