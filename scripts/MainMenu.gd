extends Control;
onready var quitButton = $quitButton;
onready var backButton = $backButton;
onready var arenaOption = $arenaOption;
onready var multi = $multiplayerOption;
onready var pvp = $pvpOption;
onready var settings = $settingsOption;
onready var single = $singleOption;
onready var chat = $chatOption;
onready var commands = $commandsOption;
onready var about = $aboutOption;
var angle :float = 0;
const speed :float = 100.0;
var able :bool = false;
var rotate2Up :bool = true;
var optionsDict ={} # Dicionario q tera d



func _ready() -> void:
	self.quitButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	
	optionsDict ={
		"about": {
			"currentDegrees": 0.0,
			"nodeObject": self.about
		},
		"chat": {
			"currentDegrees": 45.0,
			"nodeObject": self.chat
		},
		"settings": {
			"currentDegrees": 90.0,
			"nodeObject": self.settings
		},
		"pvp": {
			"currentDegrees": 135.0,
			"nodeObject": self.pvp
		},
		"arena": {
			"currentDegrees": 180.0,
			"nodeObject": self.arenaOption
		},
		"multiplayer": {
			"currentDegrees": 225.0,
			"nodeObject": self.multi
		},
		"single": {
			"currentDegrees": 270.0,
			"nodeObject": self.single
		},
		"commands": {
			"currentDegrees": 315.0,
			"nodeObject": self.commands
		}
	}
	
	for key in optionsDict:
		self.setOptionDegrees(
			optionsDict[key]["currentDegrees"], 
			optionsDict[key]["nodeObject"]
		);


func _process(delta:float) ->void:
	print(angle);
	
	if(self.able):
		angle += (delta * speed);

		for key in optionsDict:
				self.setOptionDegrees( #function parameters
					optionsDict[key]["currentDegrees"] + (-angle if(self.rotate2Up) else angle), 
					optionsDict[key]["nodeObject"]
				);


	if((angle <45) and Input.is_action_pressed("ui_up") and (self.able==false) ):
		self.able =true;
		self.rotate2Up = true;
	elif((angle <45) and Input.is_action_pressed("ui_down") and (self.able==false) ):
		self.able =true;
		self.rotate2Up = false;
		
		
	elif( angle >= 45):
		self.able = false;
		
		for key in optionsDict:
			optionsDict[key]["currentDegrees"] += (-angle if (rotate2Up) else angle);

		self.angle = 0;

	
	
func setOptionDegrees( degrees:float, option :Node ) -> void:
	var pos = Vector2(
			  cos( deg2rad(degrees)) *100.0,# O valor do Cosseno representa o eixo X
			- sin( deg2rad(degrees)) *100.0 # O valor do Seno invertido (pelo sinal de -) representa o eixo Y
		) + Vector2(287,70);

	option.set_position(pos);



func gameOffButtonPressed():
	self.get_tree().quit();

func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");
	
