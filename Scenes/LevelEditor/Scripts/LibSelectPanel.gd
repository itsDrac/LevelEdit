extends PanelContainer

@onready var listLibBox = $CenterContainer/PanelContainer/MarginContainer/LibSelectPanel/HBoxContainer/ScrollContainer/LibListBox
@onready var libPreviewPanel: TextureRect = $CenterContainer/PanelContainer/MarginContainer/LibSelectPanel/HBoxContainer/PreviewPanel

const MESHLIBPATH = "res://Scenes/LevelEditor/Assests/MeshLibs/"
signal mesh_selected(name)

var dir = DirAccess.open(MESHLIBPATH)
var files = dir.get_files()
# Called when the node enters the scene tree for the first time.
func _ready():
	var meshLibs = func():
		var libs = []
		var f = dir.get_files()
		for n in f:
			if n.ends_with(".meshlib"):
				libs.append(n)
		return libs
	
	for lib in meshLibs.call():
		add_lib_buttons(lib.get_slice(".",0))

func add_lib_buttons(name):
	var b = Button.new()
	b.text = name.to_upper()
	b.custom_minimum_size = Vector2(500,100)
	listLibBox.add_child(b)
	b.mouse_entered.connect(func(): change_preview(name))
	b.mouse_exited.connect(func(): change_preview())
	b.pressed.connect(func(): emit_signal("mesh_selected",name))

func change_preview(name=""):
	if name + ".png" in files:
		var texture = load(MESHLIBPATH+name+".png")
		libPreviewPanel.texture = texture
	else:
		libPreviewPanel.texture = null

# Called every frame. 'delta' is the elapsed time since the previous frame.

