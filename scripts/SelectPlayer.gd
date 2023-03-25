extends Control;
# var funcc = funcref(self, "mouseOnImage")
var currSelection :Array = [0, 0]; # [Y, X] current selection index array 
var characterName :Array = [
	["Frog", "Fox", "Chrono"],
	["Magus", "Ayla", "Black Mage"],
	["Ganbare Goemon", "Link", "Sora"]
]
var charactersOptionsMap :Dictionary = { }





func _ready():
	$backButton.connect("pressed", self, "backBtnPressed");
		
	for characterNode in $menuSelect.get_children():
		characterNode.connect("mouse_entered", self, "mouseOnButton", [characterNode, true]);
		characterNode.connect("mouse_exited", self, "mouseLeaveOfButton", [characterNode]);

	
	self.charactersOptionsMap = {
		0 : {
			0: $menuSelect/frogBTN,
			1: $menuSelect/foxBTN,
			2: $menuSelect/chronoBTN 
		},
		1 : {
			0: $menuSelect/magusBTN,
			1: $menuSelect/aylaBTN,
			2: $menuSelect/blackMageBTN
		},
		2 : {
			0: $menuSelect/ganbareGoemonBTN,
			1: $menuSelect/linkBTN,
			2: $menuSelect/soraBTN
		}
	}


	# print("get name via get(): ", self.charactersOptionsMap.get(0).get(0).name );

	self.mouseOnButton(
			self.charactersOptionsMap[0][0], false
	);




func _input(event :InputEvent):
	if((Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W))  &&  (self.currSelection[0] -1) >= 0):
		
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]]
		);
		self.currSelection[0] -= 1;
		print("y: ", str(currSelection[0]));
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]], false
		);
		
	elif((Input.is_key_pressed(KEY_DOWN) || Input.is_key_pressed(KEY_S))  &&  (self.currSelection[0] +1) <= 2):
		
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]]
		);
		self.currSelection[0] += 1;
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]], false
		);
	
	elif((Input.is_key_pressed(KEY_LEFT) || Input.is_key_pressed(KEY_A)) && (self.currSelection[1]-1) >=0 ):
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]]
		)
		self.currSelection[1] -= 1;
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]], false
		)
	elif((Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_D)) && (self.currSelection[1]+1) <=2 ):
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]]
		)
		self.currSelection[1] += 1;
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]] , false
		)
		


func mouseOnButton(button :TextureButton, buttonHoveredByMouse :bool):
	
	self.mouseLeaveOfButton( self.charactersOptionsMap[currSelection[0]][currSelection[1]] );
	
	if( buttonHoveredByMouse ):
		match button.name:
			"frogBTN": currSelection = [0, 0];
			"foxBTN": currSelection = [0, 1];
			"chronoBTN": currSelection = [0, 2];
			"magusBTN": currSelection = [1, 0];
			"aylaBTN": currSelection = [1, 1];
			"blackMageBTN": currSelection = [1, 2];
			"ganbareGoemonBTN": currSelection = [2, 0];
			"linkBTN": currSelection = [2, 1];
			"soraBTN": currSelection = [2, 2];
			
	
	$PlayerAttributesPanel/characterName.text = self.characterName[currSelection[0]][currSelection[1]];
		# $PlayerAttributesPanel/characterName.text = button.name;

	button.get_child(0).set_scale( Vector2(1.09, 1.07) ); #aumentando o tamanho do rect, ficando vermelho
	button.get_child(0).material.set_shader_param("isSelected", true);
	
	
	
func mouseLeaveOfButton(button :TextureButton):
	button.get_child(0).set_scale( Vector2(1.05, 1) ); #diminuindo o tamanho do rect vermelho, ficando amarelo
	button.get_child(0).material.set_shader_param("isSelected", false);



func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");




"""
var aylaCharacter :Dictionary = {
	"current": $menuSelect/aylaBTN,
	"top": self.foxCharacter,
	"right": self.blackMageCharacter,
	"bottom": self.linkCharacter,
	"left": self.magusCharacter
}

var blackMageCharacter :Dictionary = {
	"current": $menuSelect/blackMageBTN,
	"top": self.chronoCharacter,
	"right": blackMageCharacter,
	"bottom": self.soraCharacter,
	"left": self.aylaCharacter
}

var chronoCharacter :Dictionary = {
	"current": $menuSelect/chronoBTN,
	"top": chronoCharacter,
	"right": chronoCharacter,
	"bottom": self.blackMageCharacter,
	"left": self.foxCharacter
}

var foxCharacter :Dictionary = {
	"current": $menuSelect/foxBTN,
	"top": foxCharacter,
	"right": self.chronoCharacter,
	"bottom": self.aylaCharacter,
	"left": self.frogCharacter
}

var frogCharacter :Dictionary = {
	"current": $menuSelect/frogBTN,
	"top": self.frogCharacter,
	"right": self.foxCharacter,
	"bottom": self.magusCharacter,
	"left": self.frogCharacter
}
"""
