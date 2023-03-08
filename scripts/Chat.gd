extends Control
onready var backBtn = $backButton;
onready var textInput = $comment_panel/TextEdit;
onready var commentScene = preload("res://scenes/CommentTemplate.tscn");
onready var commentVContainer = $chat_panel/ScrollContainer/VBoxContainer;
onready var shadowOfUserWindow = $shadow_for_dialog;
var userName :String = "";
var ableToShow :bool = false;
var abletoHide :bool = false;
var styleboxPanel;



func _ready():
	self.backBtn.connect("pressed", self, "backBtnPressed");
	self.styleboxPanel = self.shadowOfUserWindow.get_stylebox("panel", "");
	self.styleboxPanel.bg_color.a = 0 ;
	


func _process(delta :float) -> void:
	
	if(Input.is_action_pressed("space") && !$create_user_window.visible ):
		ableToShow = true;
		self.shadowOfUserWindow.visible = true;
		$create_user_window.popup_centered();


	if(ableToShow): # Ativando efeito fade-in
		self.styleboxPanel.bg_color.a += delta;
		
		if(self.styleboxPanel.bg_color.a >= 0.8224):
			self.ableToShow = false;
			
			
	elif(abletoHide): # Ativando efeito fade-out
		self.styleboxPanel.bg_color.a -= delta;
		
		if(self.styleboxPanel.bg_color.a <= 0.0):
			self.abletoHide = false;
			self.shadowOfUserWindow.visible = false;



func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");


func _on_clearCommentBtn_pressed():
	self.textInput.text = "";


func _on_sendBtn_pressed(): #botao de enviar comentario
	var commentSceneInstance = self.commentScene.instance();
	
	commentSceneInstance.init(
		self.textInput.text,
		self.userName
	);
	
	self.textInput.text = "";
	self.commentVContainer.add_child(commentSceneInstance);



func _on_confirm_btn_pressed(): # botao de confirmar nome (janela de criar usuario)
	if($create_user_window/input_name.text == ""):
		$create_user_window/warning_name.text = "Nome não pode ser vazio!!";
	else:
		self.userName = $create_user_window/input_name.text;
		$create_user_window.visible = false;
	
	
func _on_create_user_window_popup_hide():
	self.abletoHide = true;
