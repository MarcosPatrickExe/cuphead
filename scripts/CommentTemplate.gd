extends Panel;
const textEditNode = get_node("commentText");
onready var date_and_hour_text :Label = $date_and_hour_text;


func _ready():
	print("na func ready ");
	print(self.textEditNode);
	
func _init():
	print("dentro da func ___init");
	print(self.textEditNode);
	
	
func init(comment: String):
	print("na func init ");
	print(self.textEditNode);
	
	
	self.textEditNode.text = str(comment);
	var date :Dictionary =  OS.get_datetime(false);
	
	print("data e hora: ")
	for d in date:
		print(d);
