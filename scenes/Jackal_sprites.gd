extends KinematicBody2D


var playerIsCloser = false;
var bossDirection = Vector2(0, 0);



func _on_Area2D_body_entered(body):
	
	if(body is KinematicBody2D and body.name=="Link_player"):
		self.playerIsCloser = true;

	
func _on_Area2D_body_exited(body):
	
	if(body is KinematicBody2D and body.name=="Link_player"):
		self.playerIsCloser = false;


func jackalMove( direction :Vector2 ): 	#self.newVelocity = vel;
	self.bossDirection = direction;


func _physics_process(delta):
	move_and_collide( self.bossDirection );




#	self.bossPosition = self.bossPosition.move_toward( self.bossDirection, delta*3.0 )


#func _on_Area2D_mouse_entered():
	pass
	#self.playerIsCloser = true;

#func _on_Area2D_mouse_exited():
	pass
	#self.playerIsCloser = false;
