extends KinematicBody2D


var playerIsCloser = false;
var newPosition :Vector2;


func _on_Area2D_body_entered(body):
	pass;
	
func _on_Area2D_body_exited(body):
	pass;

func _on_Area2D_mouse_entered():
	print("Enemy entered !!");
	self.playerIsCloser = true;

func _on_Area2D_mouse_exited():
	print("Enemy far away !!");
	self.playerIsCloser = false;



func jackalPosition( position :Vector2 ):
	self.newPosition = position;
	



func _physics_process(delta):
	
	move_and_collide(newPosition);

