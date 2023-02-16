extends Control
onready var timer = $Timer;
# var active :bool = false;

func _process(delta :float) -> void:
	
	if( self.timer.wait_time != 0 ):
		self.get_node("text").visible = true;
		

func _on_Timer_timeout():
	print("Atual wait time: ",self.timer.wait_time );
	get_node("text").visible = false;
