extends Control;
onready var stopButton = $quitButton;
onready var backButton = $backButton;


func _ready() -> void:
	self.quitButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	

func gameOffButtonPressed():
	self.get_tree().quit();

func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");

