extends Node2D;

var center = Vector2(480, 270);
	
	
func _process(delta):
	update();


func _draw():
	self.draw_circle(center, 50, Color.white);
	self.draw_line(center, self.get_global_mouse_position(), Color.white, 5);


