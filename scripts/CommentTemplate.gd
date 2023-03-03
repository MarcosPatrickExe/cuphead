extends Panel;
onready var textEditNode :Label = $comment_text;
onready var date_and_hour_text :Label = $date_and_hour_text;


	
func _init(comment: String):
	
	self.textEditNode.text = comment;
	var date :Dictionary =  OS.get_datetime(false);
	
	print("data e hora: ")
	for d in date:
		print(d);
