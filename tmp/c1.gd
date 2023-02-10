extends Control
class_name Child
@onready var hbox = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
#	add_button()
	pass # Replace with function body.

func add_button(id):
	var b = Button.new()
	b.text = "Button" + str(id)
	hbox.add_child(b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
