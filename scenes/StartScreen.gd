extends Control;
onready var timer = $Timer;
onready var text = $text;
var arrowCursor :Resource = load("res://Action RPG Resources/Images/cursor1.png");


func _ready() -> void:
	Input.set_custom_mouse_cursor(self.arrowCursor);
	self.timer
	

func _process(delta :float) -> void:

	#if(Input.get_action_strength("ui_accept")):  # OU:
	if(Input.is_action_pressed("space")):
		get_tree().change_scene("res://scenes/MainMenu.tscn");
	#	self.get_node("text").visible = true;
	
	
func _on_Timer_timeout():
	text.visible = not text.visible;
