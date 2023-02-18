extends Control
onready var timer = $Timer;
onready var text = $text;
# var active :bool = false;


func _process(delta :float) -> void:

	if(Input.get_action_strength("ui_accept")):
		get_tree().change_scene("MainMenu");
		print("apertou");
	#	self.get_node("text").visible = true;
	


func _on_Timer_timeout():
	text.visible = not text.visible;
