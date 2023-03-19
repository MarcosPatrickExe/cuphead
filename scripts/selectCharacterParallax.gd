extends ParallaxLayer
export var speedParallax :float = 100;


func _physics_process(delta :float) -> void:
	self.motion_offset.x += self.speedParallax;
	self.motion_offset.y += self.speedParallax;
