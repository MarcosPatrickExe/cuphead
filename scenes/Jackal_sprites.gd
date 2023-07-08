extends KinematicBody2D


var playerIsCloser = false;


func _on_Area2D_body_entered(body):
	print("Enemy entered !!");
	self.playerIsCloser = true;
	
	
func _on_Area2D_body_exited(body):
	print("Enemy far away !!");
	self.playerIsCloser = false;


func playAnotherAnimation(name: String ):
	print("state name: ",name);
	$AnimationPlayer.play(name);
	
