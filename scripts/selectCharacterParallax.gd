extends ParallaxLayer
export var speedParallax :float = 100;


func _process(delta :float) -> void:
	self.motion_offset.x += delta * self.speedParallax;
	self.motion_offset.y += delta * self.speedParallax;
