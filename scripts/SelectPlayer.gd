extends Control;


func _ready():
	$backButton.connect("pressed", self, "backBtnPressed");
	

func backBtnPressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");




func _on_soraBTN_mouse_entered():
	$menuSelect/soraBTN/soraBorder.set_scale( Vector2(1.09, 1.07) );
	$menuSelect/soraBTN/soraBorder.material.set_shader_param("isSelected", true);


func _on_soraBTN_mouse_exited():
	$menuSelect/soraBTN/soraBorder.set_scale( Vector2(1.05, 1) );
	$menuSelect/soraBTN/soraBorder.material.set_shader_param("isSelected", false);
