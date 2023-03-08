extends Control
onready var backBtn = $backButton;
onready var textInput = $comment_panel/TextEdit;
onready var commentScene = preload("res://scenes/CommentTemplate.tscn");
onready var commentVContainer = $chat_panel/ScrollContainer/VBoxContainer;
onready var shadowForWindowCreateUser = $shadow_for_dialog;
const userName :String = "";
var newColor : Color;
var able :bool = false;
var styleboxPanel;



func _ready():
	self.backBtn.connect("pressed", self, "backBtnPressed");
	self.styleboxPanel = self.shadowForWindowCreateUser.get_stylebox("panel", "");							
	

func _process(delta :float) -> void:
	
	
	if(Input.is_action_pressed("space") ):
		able = true;
		$create_user_window.popup_centered();
		
	#	var types = self.shadowForWindowCreateUser.get get_stylebox_types();
	
	#	print("stylebox color: ", names.bg_color) ;
		
	if(able):
		self.newColor.a += delta *100;
		self.styleboxPanel.bg_color= self.newColor ;



func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");


func _on_clearCommentBtn_pressed():
	self.textInput.text = "";


func _on_sendBtn_pressed():
	var commentSceneInstance = self.commentScene.instance();
	
	commentSceneInstance.init(
		self.textInput.text
	);
	
	self.textInput.text = "";
	self.commentVContainer.add_child(commentSceneInstance);
