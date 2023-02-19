extends Control
onready var timer = $Timer;
onready var text = $text;


func _process(delta :float) -> void:

	#if(Input.get_action_strength("ui_accept")):  # OU:
	if(Input.is_action_pressed("space")):
		get_tree().change_scene("res://scenes/MainMenu.tscn");
		print("apertou");
	#	self.get_node("text").visible = true;
	
	
func _on_Timer_timeout():
	text.visible = not text.visible;
