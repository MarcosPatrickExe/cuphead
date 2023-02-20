extends Control;
onready var stopButton = $stopButton;


func _ready() -> void:
	self.stopButton.connect("pressed", self, "button_pressed");
	
	
func button_pressed():
	self.get_tree().quit();
