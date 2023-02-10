extends Control

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var b = Button.new()
	b.text = "add new button"
	b.connect("pressed", increment)
	add_child(b)

func add_c1(id):
	var child = Child.new()
	child.add_button(id)

func increment():
	counter += 1
	add_c1(counter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
