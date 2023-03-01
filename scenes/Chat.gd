extends Control
onready var backBtn = $backButton;


func _ready():
	self.backBtn.connect("pressed", self, "backBtnPressed");
	
	
func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");
