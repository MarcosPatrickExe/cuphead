extends KinematicBody2D;
onready var animations = $AnimationPlayer;
enum Directions { RIGHT, DOWN, LEFT, UP };
var currentDirection;
var dirCod :int;
var playerCood = Vector2(0, 0);
var directionValues = Vector2(0, 0);
var actionsNode :Dictionary = {};


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


	if(self.playerCood != Vector2.ZERO):
		Globals.runAnimations(directionValues.x, directionValues.y, self, self.actionsNode);
	else:
		self.idleAnimations();
		
	# adicionando X e Y de "playerCood" na sua posicao atual:
	self.move_and_collide(playerCood);
	
	
	
	
func idleAnimations():
	
	# ocultando as sprites do personagem correndo:
	for count in range(0, 4):
		self.get_child(count).visible = false;
	
	
	match self.currentDirection:
		Directions.UP:
			$Sora_stopped_up.visible = true;
		Directions.DOWN:
			$Sora_stopped_down.visible = true;
		Directions.LEFT:
			$Sora_stopped.set_flip_h(false);
			$Sora_stopped.visible = true;
		Directions.RIGHT:
			$Sora_stopped.set_flip_h(true);
			$Sora_stopped.visible = true;
		
	
	
