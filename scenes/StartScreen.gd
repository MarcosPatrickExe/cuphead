extends Control
onready var timer = $Timer;
onready var text = $CenterContainer/VBoxContainer/text;
# var active :bool = false;

"""
func _process(delta :float) -> void:
	
	# if( self.timer.wait_time != 0 ):
	#	self.get_node("text").visible = true;
"""

func _on_Timer_timeout():
	
	self.get_node("CenterContainer/VBoxContainer/text").visible = not get_node("CenterContainer/VBoxContainer/text").visible
