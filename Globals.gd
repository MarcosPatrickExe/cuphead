extends Node;

var age = 18;
var isAttacking = false;



func printName( node :KinematicBody2D )->void:
	print("nome do node: ", node.name);
	
	
func getName() ->String:
	return "mario";




func runAnimations(X: int, Y: int, playerNode :KinematicBody2D):

	match X:
		-1:
			playerNode.get_child(0).set_flip_h(false);
			playerNode.animations.play("run_to_left");
			playerNode.dirCod = 1;
			playerNode.currentDirection = playerNode.Directions.LEFT;
		1:
			playerNode.get_child(0).set_flip_h(true);
			playerNode.animations.play("run_to_right");
			playerNode.dirCod = 2;
			playerNode.currentDirection = playerNode.Directions.RIGHT;
	match Y:
		1:
			playerNode.animations.play("run_to_down");
			playerNode.dirCod = 3;
			playerNode.currentDirection = playerNode.Directions.DOWN;
		-1:
			playerNode.animations.play("run_to_up");
			playerNode.dirCod = 0;
			playerNode.currentDirection = playerNode.Directions.UP;
	
	
	# ocultando as sprites com animacoes desnecessarias:
	#for count in range(0, 4):
	#	if(count == playerNode.dirCod):
	#		playerNode.get_child(count).visible = true;
	#	else:
	#		playerNode.get_child(count).visible = false;
