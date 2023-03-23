extends Control;
# var funcc = funcref(self, "mouseOnImage")
var currSelection = Vector2(0, 0); # current selection index array
var charactersOptionsMap :Dictionary = { }




func _ready():
	$backButton.connect("pressed", self, "backBtnPressed");
		
	for characterNode in $menuSelect.get_children():
		characterNode.connect("mouse_entered", self, "mouseOnButton", [characterNode]);
		characterNode.connect("mouse_exited", self, "mouseLeaveOfButton", [characterNode]);

	
	self.charactersOptionsMap = {
		"0" : {
			"0": $menuSelect/frogBTN,
			"1": $menuSelect/foxBTN,
			"2": $menuSelect/chronoBTN 
		},
		"1" : {
			"0": $menuSelect/magusBTN,
			"1": $menuSelect/aylaBTN,
			"2": $menuSelect/blackMageBTN
		},
		"2" : {
			"0": $menuSelect/ganbareGoemonBTN,
			"1": $menuSelect/linkBTN,
			"2": $menuSelect/soraBTN
		}
	}


	# print("get name via get(): ", self.charactersOptionsMap.get("0").get("0").name );
	print("get name via get(): ", self.charactersOptionsMap["0"]["0"].name );

	self.mouseOnButton(
			self.charactersOptionsMap["0"]["0"]
	);




func _input(event :InputEvent):
	if(Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W)  &&  (self.currSelection.y -1 >= 0)):
		
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection.x][currSelection.y]
		);
		self.currSelection.y -= 1;
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection.x][currSelection.y]
		);
		
	if(Input.is_key_pressed(KEY_DOWN) || Input.is_key_pressed(KEY_S)  &&  (self.currSelection.y +1 <= 2)):
		
		self.mouseLeaveOfButton(
			self.charactersOptionsMap[currSelection.x][currSelection.y]
		);
		self.currSelection.y += 2;
		self.mouseOnButton(
			self.charactersOptionsMap[currSelection.x][currSelection.y]
		);
	




func mouseOnButton(button :TextureButton):
	# print("mouse em cima do node: ",button.name);
	button.get_child(0).set_scale( Vector2(1.09, 1.07) );
	button.get_child(0).material.set_shader_param("isSelected", true);
	
	
func mouseLeaveOfButton(button :TextureButton):
	button.get_child(0).set_scale( Vector2(1.05, 1) );
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
