extends Node2D


enum CurrentState {
	STATIC_LEFT,
	STATIC_TOP,
	STATIC_RIGHT,
	STATIC_DOWN,
	WALK_LEFT,
	WALK_TOP,
	WALK_RIGHT,
	WALK_DOWN,
}


# definindo uma distancia grande entre mouse e o boss
var distance = Vector2(200, 200);


onready var jackalAnimations = $JackalSprites/AnimationPlayer;

onready var enemyBody = $"%Link_player";


func startAnimation(name :String):
	self.jackalAnimations.play(name);
