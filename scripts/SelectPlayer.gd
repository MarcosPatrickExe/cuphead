extends Control;





func _ready():
	$backButton.connect("pressed", self, "backBtnPressed");
	




func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");
