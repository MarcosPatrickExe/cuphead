extends Panel;
onready var textEditNode = $comment_text;
onready var date_and_hour_text :Label = $date_and_hour_text;

func _ready():
	print("na func ready ");
	
	
func init(comment: String):
	print("na func init "+comment);
	
	self.textEditNode.text = comment;
	var date :Dictionary =  OS.get_datetime(false);
	
	print("data e hora: ")
	for d in date:
		print(d);
