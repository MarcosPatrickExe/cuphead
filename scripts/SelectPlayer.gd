extends Control;
# var funcc = funcref(self, "mouseOnImage")
var currSelection :Array = [0, 0]; # [Y, X] current selection index array 
var characterName :Array = [
	["Frog", "Fox", "Chrono"],
	["Magus", "Ayla", "Black Mage"],
	["Ganbare Goemon", "Link", "Sora"]
]
var attributesBars :Array = [];
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
	# selecionando personagem padrao automaticamente



func _input(event :InputEvent):
	if((Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W))  &&  (self.currSelection[0] -1) >= 0):
		
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection[0]][currSelection[1]]
		);
		self.currSelection[0] -= 1;
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
	
	if( buttonHoveredByMouse ):
		self.mouseLeaveOfButton( self.charactersOptionsMap[currSelection[0]][currSelection[1]] );
	
		match button.name:
			"frogBTN": self.currSelection = [0, 0];
			"foxBTN": self.currSelection = [0, 1];
			"chronoBTN": self.currSelection = [0, 2];
			"magusBTN": self.currSelection = [1, 0];
			"aylaBTN": self.currSelection = [1, 1];
			"blackMageBTN": self.currSelection = [1, 2];
			"ganbareGoemonBTN": self.currSelection = [2, 0];
			"linkBTN": self.currSelection = [2, 1];
			"soraBTN": self.currSelection = [2, 2];
	
	# setando valores dos atributos em funcao do personagem selecionado:
	match button.name:
			"frogBTN": attributesBars = [100, 120, 90, 80, 160];
			"foxBTN": attributesBars = [100, 50, 110, 90, 50];
			"chronoBTN": attributesBars = [70, 20, 195, 50, 120];
			"magusBTN": attributesBars = [110, 120, 115, 105, 40];
			"aylaBTN": attributesBars = [80, 5, 190, 125, 180];
			"blackMageBTN": attributesBars = [80, 190, 10, 70, 40];
			"ganbareGoemonBTN": attributesBars = [190, 20, 75, 120, 30];
			"linkBTN": attributesBars = [110, 70, 130, 170, 70];
			"soraBTN": attributesBars = [110, 130, 70, 130, 100];
			
	# mudando as barras de atributos de acordo com o personagem selecionado:
	var statusBar = $PlayerAttributesPanel/attibutesBackground;
	for count in range(0, attributesBars.size() ):
		statusBar.get_child(count+5).set_value( attributesBars[count] );
	
	
	
	
	# definindo configuracoes de exibicao da imagem do personagem selecionado
	$PlayerAttributesPanel/characterName.text = self.characterName[currSelection[0]][currSelection[1]];
	var characterImgMaterial = $PlayerAttributesPanel/characterImage.material;
	characterImgMaterial.set_shader_param("image", button.material.get_shader_param("imageAddited"));
	
	# mudando imagem do lado direito de acordo com o personagem selecionado
	match button.name:
		"frogBTN": 
			characterImgMaterial.set_shader_param("scale", 1.182);
			characterImgMaterial.set_shader_param("translation", Vector2(0.042, 0.091));
		"foxBTN": 
			characterImgMaterial.set_shader_param("scale", 1.482);
			characterImgMaterial.set_shader_param("translation", Vector2(0.122, 0.191));
		"chronoBTN": 
			characterImgMaterial.set_shader_param("scale", 1.282);
			characterImgMaterial.set_shader_param("translation", Vector2(0.062, 0.191));
		"magusBTN":  
			characterImgMaterial.set_shader_param("scale", 1.262);
			characterImgMaterial.set_shader_param("translation", Vector2(0.162, 0.191));
		"aylaBTN":  
			characterImgMaterial.set_shader_param("scale", 1.356);
			characterImgMaterial.set_shader_param("translation", Vector2(0.113, 0.203));
		"blackMageBTN":  
			characterImgMaterial.set_shader_param("scale", 1.26);
			characterImgMaterial.set_shader_param("translation", Vector2(0.028, 0.133));
		"ganbareGoemonBTN":  
			characterImgMaterial.set_shader_param("scale", 1.69);
			characterImgMaterial.set_shader_param("translation", Vector2(0.178, 0.123));
		"linkBTN":  
			characterImgMaterial.set_shader_param("scale", 2.1);
			characterImgMaterial.set_shader_param("translation", Vector2(0.31, 0.447));
		"soraBTN":
			characterImgMaterial.set_shader_param("scale", 1.8);
			characterImgMaterial.set_shader_param("translation", Vector2(0.211, 0.147));
	
	
	button.get_child(0).set_scale( Vector2(1.09, 1.07) ); #aumentando o tamanho do rect, ficando vermelho
	button.get_child(0).material.set_shader_param("isSelected", true);# alterando a cor do rect para vermelho
	
	
	
func mouseLeaveOfButton(button :TextureButton):
	button.get_child(0).set_scale( Vector2(1.05, 1) ); #diminuindo o tamanho do rect vermelho, ficando amarelo
	button.get_child(0).material.set_shader_param("isSelected", false);



func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");
