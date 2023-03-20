extends Control;
# var funcc = funcref(self, "mouseOnImage")



func _ready():
	$backButton.connect("pressed", self, "backBtnPressed");
		
	for characterNode in $menuSelect.get_children():
		characterNode.connect("mouse_entered", self, "mouseOnButton", [characterNode]);
		characterNode.connect("mouse_exited", self, "mouseLeaveOfButton", [characterNode]);



func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");



func mouseOnButton(button :TextureButton):
	print("mouse em cima do node: ",button.name);
	button.get_child(0).set_scale( Vector2(1.09, 1.07) );
	button.get_child(0).material.set_shader_param("isSelected", true);
	
func mouseLeaveOfButton(button :TextureButton):
	print("mouse fora do node: ", button.name);
	button.get_child(0).set_scale( Vector2(1.05, 1) );
	button.get_child(0).material.set_shader_param("isSelected", false);

	
