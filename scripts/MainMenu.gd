extends Control;
onready var quitButton = $quitButton;
onready var backButton = $backButton;
onready var arenaOption :Node = $arenaOption;
onready var multiplaer = $multiplayerOption;
onready var pvp = $pvpOption;
onready var settings = $settingsOption;
onready var single = $singleOption;
var angle :float = 0;
const speed :float = 100.0;
var currentOptionsAngles = [90.0, 135.0, 180.0, 225.0, 270.0];
var able :bool = false;
var rotate2Up :bool = true;



func _ready() -> void:
	self.quitButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	self.setOptionAngle(90.0, self.settings);
	self.setOptionAngle(135.0, self.pvp);
	self.setOptionAngle(180.0, self.arenaOption);
	self.setOptionAngle(225.0, self.multiplaer);
	self.setOptionAngle(270.0, self.single);
	
	

func gameOffButtonPressed():
	self.get_tree().quit();

func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");



func _process(delta:float) ->void:
	print(angle);
	
	if(self.able):
		angle += (delta * speed);
		
		if(self.rotate2Up):
			self.setOptionAngle(currentOptionsAngles[2] - angle, self.arenaOption);
		else:
			self.setOptionAngle(currentOptionsAngles[2] + angle, self.arenaOption);
	
	
	if((angle <45) and Input.is_action_pressed("ui_up") and (self.able==false) ):
		self.able =true;
		self.rotate2Up = true;
	elif((angle <45) and Input.is_action_pressed("ui_down") and (self.able==false) ):
		self.able =true;
		self.rotate2Up = false;
		
		
	elif( angle >= 45):
		self.able = false;
		self.currentOptionsAngles[2] += (-angle if (rotate2Up) else angle);
		self.angle = 0;

	
	
func setOptionAngle( angle:float, option :Node ) -> void:
	var pos = Vector2(
			  cos( deg2rad(angle)) *100.0,# O valor do Cosseno representa o eixo X
			- sin( deg2rad(angle)) *100.0 # O valor do Seno invertido (pelo sinal de -) representa o eixo Y
		) + Vector2(287,70);

	option.set_position(pos);
	
	
