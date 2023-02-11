extends Control

var counter = 0
@onready var child_scene = preload("res://tmp/c1.tscn")
@onready var b =  $Button
@onready var child = child_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
#	b.connect("pressed",func (): print("clicked"))
	add_child(child)

func increment():
	print("pressed")
	counter += 1
	add_c1(counter)

func add_c1(id):
	child.add_button(id)
