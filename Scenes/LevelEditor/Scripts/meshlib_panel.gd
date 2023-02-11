extends Panel

@onready var hbox = $MarginContainer/ScrollContainer/HBoxContainer
var ico = load("res://icon.svg")
signal texture_button_clicked (id: int)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func add_preview(id: int, texture: Texture2D):
	print("here")
	var tb = TextureButton.new()
	tb.custom_minimum_size = Vector2(128,128)
#	tb.toggle_mode = true
#	tb.button_pressed = true if id == 1 else false
	tb.stretch_mode = TextureButton.STRETCH_SCALE
	tb.texture_normal = texture
	hbox.add_child(tb)
	tb.connect("pressed",func (): texture_button_click(id))
	
	

func texture_button_click(id):
	print(id," Texture Button clicked")

