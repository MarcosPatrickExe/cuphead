extends ParallaxLayer;
export var background_speedXY = -15;


func _process(delta :float) -> void:
	self.motion_offset.x += (self.background_speedXY * delta);
	self.motion_offset.y -= (self.background_speedXY * delta);
