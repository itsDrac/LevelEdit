extends Panel

@export_file("*meshlib") var pathToMeshlib: String
@onready var hbox = $MarginContainer/ScrollContainer/HBoxContainer
var meshlib: MeshLibrary 

var ico = load("res://icon.svg")
signal texture_button_clicked (id: int)
# Called when the node enters the scene tree for the first time.
func _ready():
	print("in ready")
#	name = pathToMeshlib.get_file().replace(".meshlib","").capitalize()
#	defin_meshlib(meshlib)

func defin_meshlib(lib: MeshLibrary):
	print(lib)
	for mesh in lib.get_item_list():
		add_preview(mesh, lib.get_item_preview(mesh))

func add_preview(id: int, texture: Texture2D):
	print("here")
	var tb = TextureButton.new()
	tb.custom_minimum_size = Vector2(128,128)
#	tb.toggle_mode = true
#	tb.button_pressed = true if id == 1 else false
	tb.stretch_mode = TextureButton.STRETCH_SCALE
	tb.texture_normal = texture
	hbox.add_child(tb)
	tb.pressed.connect(func(): texture_button_clicked.emit(id))
	

