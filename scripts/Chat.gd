extends Control
onready var backBtn = $backButton;
onready var textInput = $comment_panel/TextEdit;
onready var commentScene = preload("res://scenes/CommentTemplate.tscn");
onready var commentVContainer = $chat_panel/ScrollContainer/VBoxContainer;
const userName :String = "";


func _ready():
	self.backBtn.connect("pressed", self, "backBtnPressed");
	

func _process(delta :float) -> void:
	if(Input.is_action_pressed("space") ):
		$create_user_window.popup_centered( );



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
