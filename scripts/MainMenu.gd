extends Control;
onready var quitButton = $quitButton;
onready var backButton = $backButton;
onready var arenaOption = $arenaOption;
onready var multiplaer = $multiplayerOption;
onready var pvp = $pvpOption;
onready var settings = $settingsOption;
onready var single = $singleOption;
var angle :float = 0;
const speed :float = 190.0;


func _ready() -> void:
	self.quitButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	

func gameOffButtonPressed():
	self.get_tree().quit();

func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");



func _process(delta:float) ->void:
	angle += (delta * speed);
	print(angle);
	
	var pos = Vector2( 
			cos( deg2rad(angle)) *40.0, 
			sin( deg2rad(angle)) *40.0
		) + Vector2(160 ,75);
	
	self.arenaOption.set_position( pos );
	
	
	
	
