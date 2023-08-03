extends KinematicBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;
var playerCood = Vector2(0, 0);
var directionValues = Vector2(0, 0);
var actionsNode :Dictionary = {};

var isAttacking = false;



func attackFinished():
	self.isAttacking = false;


func _ready():
	self.currentDirection = Directions.RIGHT;
	self.actionsNode = {
		"stopped": $Sora_stopped,
		"stopped_down": $Sora_stopped_down,
		"stopped_up": $Sora_stopped_up
	}



func _physics_process(delta:float) -> void:
	
	self.directionValues.x = Input.get_action_strength("d") - Input.get_action_strength("a");
	self.directionValues.y = Input.get_action_strength("s") - Input.get_action_strength("w");
	
	# impedindo o personagem de andar na diagonal:
	if( (directionValues.x !=0) && (directionValues.y!=0)):
		self.directionValues = Vector2.ZERO;
		 
	self.playerCood = playerCood.move_toward(directionValues*4, delta*20.0);

	if(self.playerCood != Vector2.ZERO and (not self.isAttacking) ):
		Globals.runAnimations(directionValues.x, directionValues.y, self, self.actionsNode);
	
	
	elif( not self.isAttacking ):
		self.idleAnimations();
		
	# adicionando X e Y de "playerCood" na sua posicao atual:
	self.move_and_collide(playerCood);




func idleAnimations():
	# ocultando as sprites do personagem correndo:
#	for count in range(0, 4):
#		self.get_child(count).visible = false;
	
	#$Sora_stopped.visible = true;
	
	match self.currentDirection:
		Directions.UP:
			$AnimationPlayer.play("idle_up");
		Directions.DOWN:
			$AnimationPlayer.play("idle_down");
		Directions.LEFT:
			$Sora_stopped.set_flip_h(false);
			$AnimationPlayer.play("idle_left")
		Directions.RIGHT:
			$Sora_stopped.set_flip_h(true);
			$AnimationPlayer.play("idle_left")






func _input(event):

	if( event.is_action_released("space") ):
		
		self.playerCood = Vector2.ZERO; # impredindo o personagem de continuar correndo enquanto ataca
		self.isAttacking = true;
		
		match self.currentDirection:
			Directions.LEFT:
				$Sora_stopped.set_flip_h(false);
				$AnimationPlayer.play("attack_left");
			Directions.UP:
				$AnimationPlayer.play("attack_up");
			Directions.RIGHT:
				$Sora_stopped.set_flip_h(true);
				$AnimationPlayer.play("attack_left");
			Directions.DOWN:
				$AnimationPlayer.play("attack_down");

