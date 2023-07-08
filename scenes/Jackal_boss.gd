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

# export (CurrentState) 
var currentState = CurrentState.WALK_DOWN;


onready var jackalBossScript = $Jackal_sprites; #preload("res://scenes/Jackal_sprites.tscn").instance();



