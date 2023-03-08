extends Control
onready var backBtn = $backButton;
onready var textInput = $comment_panel/TextEdit;
onready var commentScene = preload("res://scenes/CommentTemplate.tscn");
onready var commentVContainer = $chat_panel/ScrollContainer/VBoxContainer;
onready var shadowForWindowCreateUser = $shadow_for_dialog;
const userName :String = "";
var ableToShow :bool = false;
var abletoHide :bool = false;
var styleboxPanel;



func _ready():
	self.backBtn.connect("pressed", self, "backBtnPressed");
	self.styleboxPanel = self.shadowForWindowCreateUser.get_stylebox("panel", "");
	self.styleboxPanel.bg_color.a = 0 ;
	
#	print("ready: shadow is visible: ",self.shadowForWindowCreateUser.visible);



func _process(delta :float) -> void:
	
	if(Input.is_action_pressed("space") && !$create_user_window.visible ):
		ableToShow = true;
		$create_user_window.popup_centered();


	if(ableToShow):
		self.styleboxPanel.bg_color.a += delta;
		
		if(self.styleboxPanel.bg_color.a >= 0.774):
			self.ableToShow = false;
			
	elif(abletoHide):
		self.styleboxPanel.bg_color.a -= delta;
		
		if(self.styleboxPanel.bg_color.a <= 0.0):
			self.abletoHide = false;

	if( !$create_user_window.visible ):
		self.abletoHide = true;
	


	print("is visible: ", $create_user_window.visible)


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



