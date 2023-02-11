extends TabContainer

@export_file("*meshlib") var pathToMeshlib: String

@onready var meshlib_panel = preload("res://Scenes/LevelEditor/meshlib_panel.tscn")
@onready var meshlib: MeshLibrary = load(pathToMeshlib)
# Called when the node enters the scene tree for the first time.
var meshlibName: StringName
var panels: Array[Panel]

func _ready():
	meshlibName = pathToMeshlib.get_file().replace(".meshlib","").capitalize()
	print(meshlib.get_item_list())
	create_panalChild(meshlibName)


func create_panalChild(name: StringName):
	var panalChild = meshlib_panel.instantiate()
	panalChild.name = name
	add_child(panalChild)
#	await panalChild.ready
	add_preview_in_panel(panalChild, meshlib)

func add_preview_in_panel(p, ml: MeshLibrary):
	for mesh in ml.get_item_list():
		p.add_preview(mesh,ml.get_item_preview(mesh))

