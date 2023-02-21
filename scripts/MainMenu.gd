extends Control;
onready var stopButton = $stopButton;
onready var backButton = $backButton;

func _ready() -> void:
	self.stopButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	
	
func gameOffButtonPressed():
	self.get_tree().quit();


func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");

