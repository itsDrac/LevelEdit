extends Control
class_name Child # Not required.

@onready var hbox = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
#	add_button()
	pass # Replace with function body.

func add_button(id):
	var b = Button.new()
	b.name = "b"+str(id)
	b.text = "Button " + str(id)
	hbox.add_child(b)
	b.pressed.connect(pressed)
	

func pressed():
	print("button, pressed")

