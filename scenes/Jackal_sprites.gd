extends KinematicBody2D


var playerIsCloser = false;
var bossDirection = Vector2(0, 0);
var bossPosition = Vector2.ZERO;
#var newVelocity :Vector2;


func _on_Area2D_body_entered(body):
	pass;
	
func _on_Area2D_body_exited(body):
	pass;

func _on_Area2D_mouse_entered():
	#print("Enemy entered !!");
	self.playerIsCloser = true;

func _on_Area2D_mouse_exited():
	#print("Enemy far away !!");
	self.playerIsCloser = false;



func jackalMove( direction :Vector2 ):
	#self.newVelocity = vel;
	self.bossDirection = direction;



func _physics_process(delta):
#	self.bossPosition = self.bossPosition.move_toward( self.bossDirection, delta*3.0 )
#	print("bossDirection force: ", self.bossDirection);

	move_and_collide( self.bossDirection );



