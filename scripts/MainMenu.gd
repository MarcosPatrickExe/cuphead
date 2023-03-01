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
onready var nameOption = $option_name_text;
onready var description = $description;
var angle :float = 0;
const speed :float = 100.0;
var able :bool = false;
var rotate2Up :bool = true;
var optionsDict ={} # Dicionario q tera d





func _ready() -> void:
	self.quitButton.connect("pressed", self, "gameOffButtonPressed");
	self.backButton.connect("pressed", self, "backButtonPressed")
	self.nameOption.text = "arena";
	
	optionsDict ={
		"about": {
			"currentDegrees": 0.0,
			"nodeObject": self.about,
			"description": "Conheça o criador do jogo..."
		},
		"chat": {
			"currentDegrees": 45.0,
			"nodeObject": self.chat,
			"description": "Participe do chat global e conheça novos jogadores desse jogo incrível!"
		},
		"settings": {
			"currentDegrees": 90.0,
			"nodeObject": self.settings,
			"description": "Ver e editar configurações de vídeo e áudio do jogo"
		},
		"pvp": {
			"currentDegrees": 135.0,
			"nodeObject": self.pvp,
			"description": "Batalhe com um(a) amigo(a) online!!"
		},
		"arena": {
			"currentDegrees": 180.0,
			"nodeObject": self.arenaOption,
			"description": "Derrote todos os chefões do jogo!"
		},
		"multiplayer": {
			"currentDegrees": 225.0,
			"nodeObject": self.multi,
			"description": "Jogue com seu amigo no mundo aberto \n no qual é habitado por vários inimigos!"
		},
		"single": {
			"currentDegrees": 270.0,
			"nodeObject": self.single,
			"description": "Explore sozinho o mundo aberto e \n derrote vários inimigos!"
		},
		"commands": {
			"currentDegrees": 315.0,
			"nodeObject": self.commands,
			"description": "Veja aqui todos os comandos para \n controlar o seu personagem!"
		}
	}
	
	for key in optionsDict:
		self.setOptionDegrees(
			optionsDict[key]["currentDegrees"], 
			optionsDict[key]["nodeObject"]
		);


func _process(delta:float) ->void:
	# print(angle);
	
	
	
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
			optionsDict[key]["currentDegrees"] += (-45 if (rotate2Up) else 45);
		
			if( int(optionsDict[key]["currentDegrees"]) % 180==0 ):
				self.nameOption.text = str(key);
				self.description.text = optionsDict[key]["description"];
				
			print(str(key) +" // "+str(optionsDict[key]["currentDegrees"]));
		print("========================================= \n")
			
		self.angle = 0;

	
	
func setOptionDegrees( degrees:float, optionNode :Node ) -> void:
	var pos = Vector2(
			  cos( deg2rad(degrees)) *100.0,# O valor do Cosseno representa o eixo X
			- sin( deg2rad(degrees)) *100.0 # O valor do Seno invertido (pelo sinal de -) representa o eixo Y
		) + Vector2(900,208);

	optionNode.set_position(pos);



func gameOffButtonPressed():
	self.get_tree().quit();

func backButtonPressed():
	self.get_tree().change_scene("res://scenes/StartScreen.tscn");
	
