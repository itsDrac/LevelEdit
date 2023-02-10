extends Control

var counter = 0
var child_scene = preload("res://tmp/c1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var b = Button.new()
	b.text = "add new button"
	b.pressed.connect(self.increment)
	add_child(b)

func add_c1(id):
	var child = child_scene.instantiate()
	add_child(child)
	child.add_button(id)

func increment():
	print("pressed")
	counter += 1
	add_c1(counter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
